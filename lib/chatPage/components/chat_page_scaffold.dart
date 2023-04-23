import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/chatPage/components/chat_top_bar_component.dart';
import 'package:mafqood/chatPage/components/message_text_field_component.dart';
import 'package:mafqood/chatPage/components/messages_component.dart';
import 'package:mafqood/chatPage/controller.dart';
import 'package:mafqood/chatPage/state.dart';
import 'package:mafqood/size_config.dart';
import 'package:mafqood/widgets/bloc_temp_widget.dart';

import '../../widgets/main_layout_widget.dart';

class ChatPageScaffold extends StatelessWidget {
  const ChatPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatPageController blocController = ChatPageController.of(context);
    return MainLayoutWidget(
        extendBodyBehindAppBar: true,
        backGroundColor: Colors.white,
        widthMargin: 0,
        heightMargin: 0,
        minHeight: 0.0,
        maxHeight: SizeConfig.screenHeight,
        widget: BlocBuilder(
          bloc: blocController,
          builder: (context, state) {
            return BlocTempWidget(
              successWidget: Expanded(
                child: Column(
                  children: const [
                    SizedBox(width: double.infinity,),
                    ChatTopBarComponent(),
                    MessagesComponent(),
                    ChatTextFieldComponent(),
                  ],
                ),
              ),
              errorState: state is ChatPageError,
              loadingState: state is ChatPageLoading,
            );
          },
        ));
  }
}
