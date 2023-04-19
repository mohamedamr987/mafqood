import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/models/report_model.dart';
import 'components/view_report_page_scaffold.dart';
import 'controller.dart';

class ViewReportPageView extends StatelessWidget {
  final ReportModel reportModel;
  const ViewReportPageView({Key? key, required this.reportModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewReportPageController(reportModel),
      child: const ViewReportPageScaffold(),
    );
  }
}
