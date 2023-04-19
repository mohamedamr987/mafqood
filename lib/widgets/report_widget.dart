import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/core/models/report_model.dart';
import 'package:mafqood/size_config.dart';
import 'package:mafqood/viewReportPage/view_report_page_view.dart';
import 'package:mafqood/widgets/cache_image_widget.dart';
import 'package:mafqood/widgets/report_sub_info_widget.dart';

class ReportWidget extends StatelessWidget {
  final ReportModel reportModel;
  const ReportWidget({Key? key, required this.reportModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationHelper.push(context, ViewReportPageView(reportModel: reportModel,),),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: (SizeConfig.screenWidth - 80)/2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: kPrimaryColor, width: 2),
        ),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: CacheImageWidget(
                image: reportModel.image,
                height: 88,
                width: (SizeConfig.screenWidth - 80) / 2,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6,),
              child: Column(
                children: [
                  ReportSubInfoWidget(title: "Name", value: reportModel.name,),
                  ReportSubInfoWidget(title: "Age", value: reportModel.age),
                  ReportSubInfoWidget(title: "Address", value: reportModel.place,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
