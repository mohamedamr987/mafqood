import 'package:flutter/material.dart';
import 'package:mafqood/editProfilePage/widgets/edit_profile_text_field_widget.dart';
import 'package:mafqood/widgets/general_button.dart';

import '../../constants.dart';
import '../controller.dart';

class LoginTextFieldsComponent extends StatelessWidget {
  const LoginTextFieldsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditProfilePageController blocController = EditProfilePageController.of(context);
    return Column(
      children: [
        EditProfileTextFieldWidget(title: "Your Email", textEditingController: blocController.emailController, keyboardType: TextInputType.emailAddress,),
        const SizedBox(height: 8,),
        EditProfileTextFieldWidget(title: "Your Password", textEditingController: blocController.passwordController, keyboardType: TextInputType.text, isPassword: true,),
        const SizedBox(height: 110,),
        GeneralButton(
          text: "Edit",
          onPressed: blocController.signInRequest,
          elevation: 0.0,
          gradient: kLinearGradient,
        ),

      ],
    );
  }
}
