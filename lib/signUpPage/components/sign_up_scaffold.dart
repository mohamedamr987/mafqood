import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/widgets/general_text.dart';

import '../../widgets/main_layout_widget.dart';
import '../controller.dart';
import 'sign_up_text_fields_component.dart';

class SignUpPageScaffold extends StatelessWidget {
  const SignUpPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpPageController blocController = SignUpPageController.of(context);
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      widthMargin: 30,
      widget: Form(
        key: blocController.formKey,
        child: Column(
          children: [
            const SizedBox(height: 70,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(width: double.infinity,),
                GeneralText(text: "Sign Up", size: 34, isBold: true, color: kPrimaryColor,),
                SizedBox(height: 70,),
              ],
            ),
            const SignUpTextFieldsComponent(),
          ],
        ),
      ),
    );
  }
}
