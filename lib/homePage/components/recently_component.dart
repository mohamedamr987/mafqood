import 'package:flutter/material.dart';
import 'package:mafqood/homePage/controller.dart';
import 'package:mafqood/widgets/wrap_of_reports_widget.dart';

class RecentlyComponent extends StatelessWidget {
  const RecentlyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController blocController = HomePageController.of(context);
    return WrapOfReportsWidget(reports: blocController.recentReports, title: "Recently",);
  }
}
