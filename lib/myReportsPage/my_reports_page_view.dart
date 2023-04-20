import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/my_reports_page_scaffold.dart';
import 'controller.dart';

class MyReportsPageView extends StatelessWidget {
  const MyReportsPageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyReportsPageController()..getMyReports(),
      child: const MyReportsPageScaffold(),
    );
  }
}
