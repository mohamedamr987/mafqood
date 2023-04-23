import 'package:flutter/material.dart';
import 'package:mafqood/chatPage/models/message_model.dart';
import 'package:mafqood/chatPage/widgets/message_time_widget.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/widgets/general_text.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel messageModel;
  const MessageWidget({Key? key, required this.messageModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: messageModel.isMe?MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: messageModel.isMe? Colors.grey[200] : kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: messageModel.isMe?const Radius.circular(20):const Radius.circular(0),
              bottomRight: messageModel.isMe?const Radius.circular(0):const Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: messageModel.isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
            children: [
              GeneralText(text: messageModel.message, color: Colors.black, size: 16,),
              const SizedBox(height: 5,),
              MessageTimeWidget(dateTime: messageModel.time, color: messageModel.isMe ? Colors.grey : Colors.white,),
            ],
          ),
        )
      ],
    );
  }
}