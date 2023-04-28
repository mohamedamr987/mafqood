import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mafqood/chatPage/models/message_model.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/core/errors/failures.dart';
import 'package:mafqood/core/repo/repo.dart';

class ChatRepo extends Repository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String otherUserName = "";
  String otherFcmToken = "";
  DocumentReference? chatRef;
  CollectionReference? chatMessagesRef;
  List<MessageModel> messages = [];
  Future<Either<Failure, void>> sendMessage(String message) async {
    return await exceptionHandler<void>(
      () async {
        await chatMessagesRef!.add({
          "message": message,
          "from" : CoreInfo.auth.currentUser!.uid,
          "time": DateTime.now().millisecondsSinceEpoch,
        });
      },
    );
  }

  Future<Either<Failure, void>> initChat(String otherUserUid) async {
    return await exceptionHandler<void>(
      () async {
        DocumentReference userRef = await getUserRef(CoreInfo.auth.currentUser!.uid);
        DocumentReference otherUserRef = await getUserRef(otherUserUid);
        otherUserName = await otherUserRef.get().then((value) => (value.data() as Map<String, dynamic>)["fullName"]);
        chatRef = await getChatRef(otherUserUid, userRef, otherUserRef);
        chatRef ??= await createChat(otherUserUid, userRef, otherUserRef);
        await initChatMessages();

      },
    );
  }

  Future<void> initChatMessages() async {
    chatMessagesRef = chatRef!.collection("messages");
    final result = await (chatMessagesRef!.orderBy("time", descending: true)).get();
    messages = result.docs.map((e) => MessageModel.fromJson(e.data() as Map<String, dynamic>)).toList();
  }

  Future<DocumentReference?> getChatRef(String otherUserUid,
      DocumentReference userRef, DocumentReference otherUserRef) async {
    final result1 = await firestore
        .collection("chats")
        .where("user1", isEqualTo: userRef)
        .where("user2", isEqualTo: otherUserRef)
        .get();
    if (result1.docs.isNotEmpty) {
      print("Got chat from previous");
      return result1.docs.first.reference;
    }
    final result2 = await firestore
        .collection("chats")
        .where("user1", isEqualTo: otherUserRef)
        .where("user2", isEqualTo: userRef)
        .get();
    if (result2.docs.isNotEmpty) {
      print("Got chat from previous");
      return result2.docs.first.reference;
    }

    return null;
  }

  Future<DocumentReference> createChat(String otherUserUid,
      DocumentReference userRef, DocumentReference otherUserRef) async {
    print("created chat from start");
    return await firestore.collection("chats").add({
      "user1": userRef,
      "user2": otherUserRef,
    });
  }

  Future<DocumentReference> getUserRef(String userUid) async {
    return firestore
        .collection("users")
        .where("uid", isEqualTo: userUid)
        .get()
        .then((value) => value.docs.first.reference);
  }
}
