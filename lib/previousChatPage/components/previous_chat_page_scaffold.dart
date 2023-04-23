import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/previousChatPage/components/previous_chat_component.dart';
import 'package:mafqood/previousChatPage/controller.dart';
import 'package:mafqood/widgets/bloc_temp_widget.dart';

import '../../widgets/main_layout_widget.dart';
import '../state.dart';
import 'previous_chat_search_component.dart';

class PreviousChatPageScaffold extends StatelessWidget {
  const PreviousChatPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreviousChatPageController blocController = PreviousChatPageController.of(context);
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      widthMargin: 30,
      heightMargin: 40,
      widget: BlocBuilder(
        bloc: blocController,
        builder: (context, state){
          return BlocTempWidget(
            successWidget: Column(
              children: const [
                SizedBox(width: double.infinity,),
                PreviousChatSearchComponent(),
                SizedBox(height: 40,),
                PreviousChatComponent()
              ],
            ),
            errorState: state is PreviousChatPageError,
            loadingState: state is PreviousChatPageLoading,
          );
        },
      )
    );
  }
}
