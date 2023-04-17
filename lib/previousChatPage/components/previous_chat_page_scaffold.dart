import 'package:flutter/material.dart';
import 'package:mafqood/previousChatPage/components/previous_chat_component.dart';

import '../../widgets/main_layout_widget.dart';
import 'previous_chat_search_component.dart';

class PreviousChatPageScaffold extends StatelessWidget {
  const PreviousChatPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      widthMargin: 30,
      heightMargin: 40,
      widget: Column(
        children: const [
          SizedBox(width: double.infinity,),
          PreviousChatSearchComponent(),
          SizedBox(height: 40,),
          PreviousChatComponent()
        ],
      ),
    );
  }
}
