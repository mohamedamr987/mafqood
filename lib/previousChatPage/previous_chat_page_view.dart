import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/previous_chat_page_scaffold.dart';
import 'controller.dart';

class PreviousChatPageView extends StatelessWidget {
  const PreviousChatPageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PreviousChatPageController(),
      child: const PreviousChatPageScaffold(),
    );
  }
}
