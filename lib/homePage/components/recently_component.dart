import 'package:flutter/material.dart';
import 'package:mafqood/homePage/controller.dart';
import 'package:mafqood/widgets/general_text.dart';
import 'package:mafqood/widgets/report_widget.dart';

class RecentlyComponent extends StatelessWidget {
  const RecentlyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController blocController = HomePageController.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: (){
        if(blocController.recentReports.isEmpty){
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
            const GeneralText(text: "Recently", size: 20, isBold: true,),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 20,
                children: List<Widget>.from(blocController.recentReports.map((e) => ReportWidget(reportModel: e)).toList(),),
              ),
            )
          ],
        );
      }(),
    );
  }
}
