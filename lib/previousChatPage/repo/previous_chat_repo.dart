import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mafqood/chatPage/models/message_model.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/core/errors/failures.dart';
import 'package:mafqood/core/repo/repo.dart';
import 'package:mafqood/previousChatPage/models/previous_chat_model.dart';

class PreviousChatRepo extends Repository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<PreviousChatModel> previousChatList = [];

  Future<Either<Failure, List<PreviousChatModel>>> getPreviousChatList() async {
    return await exceptionHandler<List<PreviousChatModel>>(
      () async {
        previousChatList.clear();
        var user = FirebaseAuth.instance.currentUser;
        DocumentReference loggedUserRef = await getUserRef(user!.uid);
        var previousChat = await (firestore.collection("chats").where("user1", isEqualTo: loggedUserRef,)).get();
        var previousChat2 = (await (firestore.collection("chats").where("user2", isEqualTo: loggedUserRef,)).get());
        List<QueryDocumentSnapshot<Map<String, dynamic>>> previousChatDocs = [...previousChat.docs,...previousChat2.docs];
        for (var chat in previousChatDocs) {
          var chatData = chat.data();

          QueryDocumentSnapshot lastMessageRef = (await (chat.reference.collection("messages")).orderBy("time", descending: true).limit(1).get()).docs.first;
          Map<String, dynamic> otherUser = await getOtherUserFullName(chatData);
          previousChatList.add(PreviousChatModel(
            name: otherUser["fullName"],
            message: lastMessageRef["message"],
            time: DateTime.fromMillisecondsSinceEpoch(lastMessageRef["time"]), userUid: otherUser["uid"],
          ));
        }
        previousChatList.sort((a, b) => b.time.isAfter(a.time) ? 1 : -1);
        return previousChatList;
      },
    );
  }

  Future<Map<String, dynamic>> getOtherUserFullName(Map<String, dynamic> data) async {
    final DocumentReference user1Ref = data["user1"];
    final DocumentReference user2Ref = data["user2"];
    Map<String, dynamic> user1 = ((await user1Ref.get()).data() as Map<String, dynamic>);
    Map<String, dynamic> user2 = ((await user2Ref.get()).data() as Map<String, dynamic>);
    return (user1["fullName"] == CoreInfo.auth.currentUser!.displayName) ? user2 : user1;
  }

  Future<DocumentReference> getUserRef(String userUid) async {
    return firestore.collection("users").doc(userUid);
  }
}
