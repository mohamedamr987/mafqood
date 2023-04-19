import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/viewReportPage/components/info_component.dart';
import 'package:mafqood/viewReportPage/components/report_image_component.dart';
import 'package:mafqood/viewReportPage/components/start_chatting_component.dart';
import 'package:mafqood/viewReportPage/components/tips_component.dart';
import 'package:mafqood/viewReportPage/controller.dart';
import 'package:mafqood/viewReportPage/widgets/sub_info_widget.dart';
import 'package:mafqood/widgets/general_app_bar_widget.dart';
import 'package:mafqood/widgets/general_text.dart';

import '../../widgets/main_layout_widget.dart';

class ViewReportPageScaffold extends StatelessWidget {
  const ViewReportPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      appBar: generalAppBar(title: '', backgroundColor: kPrimaryColor.withOpacity(0.5,),),
      widthMargin: 30,
      heightMargin: 32,
      widget: Column(
        children: const [
          SizedBox(width: double.infinity,),
          ReportImageComponent(),
          InfoComponent(),
          TipsComponent(),
          SizedBox(height: 24,),
          StartChattingComponent(),
        ],
      ),
    );
  }
}
