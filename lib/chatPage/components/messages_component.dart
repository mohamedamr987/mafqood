import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/chatPage/controller.dart';
import 'package:mafqood/chatPage/state.dart';
import 'package:mafqood/chatPage/widgets/message_widget.dart';

import 'package:mafqood/widgets/general_text.dart';

class MessagesComponent extends StatelessWidget {
  const MessagesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatPageController blocController = ChatPageController.of(context);
    return BlocBuilder(
      bloc: blocController,
      buildWhen: (previous, current) => current is ChatPageMessageChange,
      builder: (context, state){
        return Expanded(
            child: (){
              if(blocController.chatRepo.messages.isEmpty) {
                return const Center(
                  child: GeneralText(text: "Still no messages between you and this user.",),
                );
              }
              return ListView.builder(
                itemCount: blocController.chatRepo.messages.length,
                shrinkWrap: true,
                reverse: true,
                itemBuilder: (context, index) {
                  return MessageWidget(messageModel: blocController.chatRepo.messages[index],);
                },
              );
            }()
        );
      },
    );
  }
}
