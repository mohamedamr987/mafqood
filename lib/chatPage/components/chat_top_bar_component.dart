import 'package:flutter/material.dart';
import 'package:mafqood/chatPage/controller.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/widgets/general_text.dart';

class ChatTopBarComponent extends StatelessWidget {
  const ChatTopBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatPageController blocController = ChatPageController.of(context);
    return Container(
      color: const Color(0xFFC5E8F7).withOpacity(0.7),
      height: 70,
      child: Row(
        children: [
          const SizedBox(width: 10,),
          InkWell(
            onTap: ()=> Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: kPrimaryColor,),
          ),
          const Spacer(),
          GeneralText(text: blocController.chatRepo.otherUserName, color: Colors.black, size: 20,),
          const Spacer(),
          const Icon(Icons.more_vert, color: Colors.transparent,),
          const SizedBox(width: 10,),
        ],
      ),
    );
  }
}
