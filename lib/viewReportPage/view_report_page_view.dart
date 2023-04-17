import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/view_report_page_scaffold.dart';
import 'controller.dart';

class ViewReportPageView extends StatelessWidget {
  const ViewReportPageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewReportPageController(),
      child: const ViewReportPageScaffold(),
    );
  }
}
