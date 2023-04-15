import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/createReportPage/components/category_drop_down_component.dart';
import 'package:mafqood/createReportPage/components/create_report_button.dart';
import 'package:mafqood/createReportPage/components/pick_image_component.dart';
import 'package:mafqood/widgets/general_text.dart';

import '../../widgets/general_app_bar_widget.dart';
import '../../widgets/main_layout_widget.dart';
import '../controller.dart';
import 'create_report_text_fields_component.dart';

class CreateReportPageScaffold extends StatelessWidget {
  const CreateReportPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateReportPageController blocController = CreateReportPageController.of(context);
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      widthMargin: 30,
      widget: Form(
        key: blocController.createReportModel.formKey,
        child: Column(
          children: const [
            SizedBox(width: double.infinity,),
            GeneralText(text: "Create report", size: 34, isBold: true, color: kPrimaryColor,),
            SizedBox(height: 24,),
            PickImageComponent(),
            SizedBox(height: 24,),
            CreateReportTextFieldsComponent(),
            SizedBox(height: 12,),
            CategoryDropdownComponent(),
            SizedBox(height: 24,),
            CreateReportButton(),
          ],
        ),
      ),
    );
  }
}
