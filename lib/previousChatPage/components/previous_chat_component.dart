import 'package:flutter/material.dart';
import 'package:mafqood/previousChatPage/widgets/previous_chat_widget.dart';

class PreviousChatComponent extends StatelessWidget {
  const PreviousChatComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(20, (index) => const PreviousChatWidget()),
    );
  }
}
