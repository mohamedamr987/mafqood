import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/create_report_scaffold.dart';
import 'controller.dart';

class CreateReportPageView extends StatelessWidget {
  const CreateReportPageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateReportPageController(),
      child: const CreateReportPageScaffold(),
    );
  }
}
