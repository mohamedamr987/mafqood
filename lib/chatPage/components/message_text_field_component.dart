import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/constants.dart';

import '../controller.dart';
class ChatTextFieldComponent extends StatefulWidget {
  const ChatTextFieldComponent({Key? key}) : super(key: key);

  @override
  State<ChatTextFieldComponent> createState() => _ChatTextFieldComponentState();
}

class _ChatTextFieldComponentState extends State<ChatTextFieldComponent> {

  @override
  Widget build(BuildContext context) {
    ChatPageController blocController = ChatPageController.of(context);
    return BlocBuilder(
      bloc: blocController,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: blocController.writeController,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              hintText: "Type your message here",
              hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.7),),
              suffixIcon: blocController.writeController.text.isNotEmpty ? IconButton(
                onPressed: () {
                  blocController.sendMessage();
                },
                icon: const Icon(Icons.send, color: kPrimaryColor,),
              ) : const SizedBox.shrink(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(color: kPrimaryColor,),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(color: kPrimaryColor,),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
