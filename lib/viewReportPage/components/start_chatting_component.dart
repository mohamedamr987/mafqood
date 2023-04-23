import 'package:flutter/material.dart';
import 'package:mafqood/chatPage/chat_page_view.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/viewReportPage/controller.dart';
import 'package:mafqood/widgets/general_button.dart';

class StartChattingComponent extends StatelessWidget {
  const StartChattingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewReportPageController blocController = ViewReportPageController.of(context);
    if(blocController.reportModel.isReportMine){
      return GeneralButton(
        text: "Delete report",
        onPressed: blocController.deleteReport,
        backgroundColor: Colors.red,
      );
    }
    return GeneralButton(text: "Start Chatting", onPressed: ()=> NavigationHelper.push(context, ChatPageView(userUid: blocController.reportModel.userUid,),),);
  }
}
