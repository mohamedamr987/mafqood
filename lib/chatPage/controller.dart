import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/chatPage/models/message_model.dart';
import 'package:mafqood/chatPage/repo/chat_repo.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/widgets/snack_bar_shower.dart';

import 'state.dart';

class ChatPageController extends Cubit<ChatPageState> {
  ChatPageController(this.userUid) : super(ChatPageInit()){
    initChat();
  }

  static ChatPageController of(context) => BlocProvider.of(context);
  final TextEditingController writeController = TextEditingController();
  final String userUid;
  final ChatRepo chatRepo = ChatRepo();

  void initChat() async {
    emit(ChatPageLoading());
    final result = await chatRepo.initChat(userUid);
    receiveMessageFromStream();
    result.fold((l) {
      emit(ChatPageError());
    }, (r) {
      emit(ChatPageDone());
    });
  }

  void sendMessage() async {
    String message = writeController.text;
    writeController.clear();
    chatRepo.messages.insert(0,MessageModel.fromMe(message));
    emit(ChatPageMessageChange());
    final result = await chatRepo.sendMessage(message);
    result.fold((l) {
      snackBarShower(l.message??kErrorText);
    }, (r) {});
  }
  void receiveMessageFromStream(){
    chatRepo.chatMessagesRef?.snapshots().listen(
          (event) {
            print("Got new message");
            final message = MessageModel.fromJson(event.docChanges.first.doc.data() as Map<String, dynamic>);
            if(!message.isMe){
              if((chatRepo.messages.isNotEmpty && message.time.isBefore(chatRepo.messages[0].time))) return;
              chatRepo.messages.insert(0,message);
              emit(ChatPageMessageChange());
            }
          },
        );
  }
}
