import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/chatPage/controller.dart';
import 'components/chat_page_scaffold.dart';


class ChatPageView extends StatelessWidget {
  final String userUid;
  const ChatPageView({Key? key, required this.userUid,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatPageController(userUid),
      child: const ChatPageScaffold(),
    );
  }
}
