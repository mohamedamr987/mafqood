import 'package:flutter/material.dart';
import 'package:mafqood/widgets/auth_text_field.dart';
import 'package:mafqood/widgets/general_button.dart';
import 'package:mafqood/widgets/general_text.dart';

import '../../constants.dart';
import '../controller.dart';

class CreateReportTextFieldsComponent extends StatelessWidget {
  const CreateReportTextFieldsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateReportPageController blocController = CreateReportPageController.of(context);
    return Column(
      children: [
        AuthTextField(
          prefixIcon: Icons.person,
          keyboardType: TextInputType.text,
          textController: blocController.createReportModel.name,
          labelText: "Name",
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        const SizedBox(height: 12,),
        AuthTextField(
          prefixIcon: Icons.timelapse,
          keyboardType: TextInputType.text,
          textController: blocController.createReportModel.age,
          labelText: "Age",
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        const SizedBox(height: 12,),
        AuthTextField(
          prefixIcon: Icons.location_on,
          keyboardType: TextInputType.text,
          textController: blocController.createReportModel.place,
          labelText: "Place",
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        const SizedBox(height: 12,),
        AuthTextField(
          prefixIcon: Icons.description,
          keyboardType: TextInputType.multiline,
          textController: blocController.createReportModel.description,
          labelText: "Description",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          minLines: 1,
          maxLines: 5,
        ),
      ],
    );
  }
}
