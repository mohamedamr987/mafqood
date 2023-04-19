import 'package:flutter/material.dart';
import 'package:mafqood/viewReportPage/controller.dart';
import 'package:mafqood/widgets/cache_image_widget.dart';

class ReportImageComponent extends StatelessWidget {
  const ReportImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewReportPageController blocController = ViewReportPageController.of(context);
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: CacheImageWidget(
        image: blocController.reportModel.image,
        fit: BoxFit.fill,
      ),
    );
  }
}
