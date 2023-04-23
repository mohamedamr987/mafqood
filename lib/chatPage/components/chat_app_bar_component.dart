import 'package:flutter/material.dart';
import 'package:mafqood/chatPage/controller.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/widgets/general_text.dart';

AppBar chatAppBarComponent(BuildContext context) {
  ChatPageController blocController = ChatPageController.of(context);
  return AppBar(
    backgroundColor: const Color(0xFFC5E8F7),
    elevation: 0.0,
    leading: InkWell(
      onTap: ()=> Navigator.pop(context),
      child: const Icon(Icons.arrow_back, color: kPrimaryColor,),
    ),
    title: GeneralText(text: blocController.chatRepo.otherUserName, color: Colors.black, size: 20,),
    centerTitle: true,
  );
}
