import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/viewReportPage/components/report_image_component.dart';
import 'package:mafqood/viewReportPage/components/start_chatting_component.dart';
import 'package:mafqood/viewReportPage/components/tips_component.dart';
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
        children: [
          const SizedBox(width: double.infinity,),
          const ReportImageComponent(),
          const SizedBox(height: 32,),
          const SubInfoWidget(title: "Name", value: "Mohamed Amr"),
          const SubInfoWidget(title: "Age", value: "10 years"),
          const SubInfoWidget(title: "Place", value: "Mansoura"),
          GeneralText(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit." * 3,
          ),
          const SizedBox(height: 25,),
          const TipsComponent(),
          const SizedBox(height: 24,),
          const StartChattingComponent(),
        ],
      ),
    );
  }
}
