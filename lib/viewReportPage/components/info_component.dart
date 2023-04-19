import 'package:flutter/material.dart';
import 'package:mafqood/viewReportPage/widgets/sub_info_widget.dart';

import '../../widgets/general_text.dart';
import '../controller.dart';

class InfoComponent extends StatelessWidget {
  const InfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewReportPageController blocController = ViewReportPageController.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32,),
        SubInfoWidget(title: "Name", value: blocController.reportModel.name,),
        SubInfoWidget(title: "Age", value: blocController.reportModel.age,),
        SubInfoWidget(title: "Place", value: blocController.reportModel.place,),
        GeneralText(
          text: blocController.reportModel.description,
        ),
        const SizedBox(height: 25,),
      ],
    );
  }
}
