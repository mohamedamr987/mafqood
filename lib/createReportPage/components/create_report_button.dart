import 'package:flutter/material.dart';
import 'package:mafqood/createReportPage/controller.dart';
import 'package:mafqood/widgets/general_button.dart';

class CreateReportButton extends StatelessWidget {
  const CreateReportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateReportPageController blocController = CreateReportPageController.of(context);
    return GeneralButton(
      text: "Create",
      onPressed: blocController.createReport,
    );
  }
}
