import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/widgets/general_text.dart';

import '../../widgets/general_app_bar_widget.dart';
import '../../widgets/main_layout_widget.dart';
import '../controller.dart';
import 'edit_profile_text_fields_component.dart';

class EditProfilePageScaffold extends StatelessWidget {
  const EditProfilePageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditProfilePageController blocController = EditProfilePageController.of(context);
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      appBar: generalAppBar(title: "Edit profile",),
      widthMargin: 30,
      widget: Form(
        key: blocController.formKey,
        child: Column(
          children: const [
            SizedBox(height: 25,),
            LoginTextFieldsComponent(),
          ],
        ),
      ),
    );
  }
}
