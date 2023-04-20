import 'package:flutter/material.dart';
import 'package:mafqood/core/models/report_model.dart';
import 'package:mafqood/widgets/general_text.dart';

import 'report_widget.dart';

class WrapOfReportsWidget extends StatelessWidget {
  final List<ReportModel> reports;
  final String? title;
  const WrapOfReportsWidget({Key? key, required this.reports, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: (){
        if(reports.isEmpty){
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30,),
              child: GeneralText(text: "There is no reports in the meanwhile.", size: 20, isBold: true, textAlign: TextAlign.center,),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(title != null)
              ...[
                GeneralText(text: title!, size: 20, isBold: true,),
                const SizedBox(height: 20,),
              ],
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 20,
                children: List<Widget>.from(reports.map((e) => ReportWidget(reportModel: e)).toList(),),
              ),
            )
          ],
        );
      }(),
    );
  }
}
