import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/size_config.dart';
import 'package:mafqood/viewReportPage/view_report_page_view.dart';
import 'package:mafqood/widgets/cache_image_widget.dart';
import 'package:mafqood/widgets/report_sub_info_widget.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationHelper.push(context, const ViewReportPageView(),),
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
                image: "https://childmind.org/wp-content/uploads/2021/07/our-impact-header-half-r.jpg",
                height: 88,
                width: (SizeConfig.screenWidth - 80) / 2,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6,),
              child: Column(
                children: const [
                  ReportSubInfoWidget(title: "Name", value: "Ahmed Mohamed",),
                  ReportSubInfoWidget(title: "Age", value: "10 years",),
                  ReportSubInfoWidget(title: "Address", value: "Cairo",),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
