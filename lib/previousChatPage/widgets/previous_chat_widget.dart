import 'package:flutter/material.dart';
import 'package:mafqood/chatPage/chat_page_view.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/widgets/general_text.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/previous_chat_model.dart';

class PreviousChatWidget extends StatelessWidget {
  final PreviousChatModel previousChatModel;
  const PreviousChatWidget({Key? key, required this.previousChatModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> NavigationHelper.push(context, ChatPageView(userUid: previousChatModel.userUid,),),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 16,),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralText(text: previousChatModel.name, size: 16, isBold: true,),
                  const SizedBox(height: 5,),
                  GeneralText(text: previousChatModel.message, size: 14, color: Colors.grey,),
                ],
              ),
            ),
            GeneralText(text: timeago.format(previousChatModel.time)),
          ],
        ),
      ),
    );
  }
}
