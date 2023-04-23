import 'package:flutter/material.dart';
import 'package:mafqood/previousChatPage/controller.dart';
import 'package:mafqood/previousChatPage/widgets/previous_chat_widget.dart';

class PreviousChatComponent extends StatelessWidget {
  const PreviousChatComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreviousChatPageController blocController = PreviousChatPageController.of(context);
    return Column(
      children: blocController.previousChatList.map((e) => PreviousChatWidget(previousChatModel: e,)).toList(),
    );
  }
}
