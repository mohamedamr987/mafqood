import 'package:flutter/material.dart';
import 'package:mafqood/widgets/auth_text_field.dart';
import 'package:mafqood/widgets/general_button.dart';
import 'package:mafqood/widgets/general_text.dart';

import '../../constants.dart';
import '../../core/validation/email_validation.dart';
import '../controller.dart';

class SignUpTextFieldsComponent extends StatelessWidget {
  const SignUpTextFieldsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpPageController blocController = SignUpPageController.of(context);
    return Column(
      children: [
        AuthTextField(
          prefixIcon: Icons.person,
          keyboardType: TextInputType.text,
          textController: blocController.fullNameController,
          labelText: "Full name",
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        const SizedBox(height: 8,),
        AuthTextField(
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          textController: blocController.emailController,
          labelText: "Email",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          validation: (String? email){
            if(!isEmail(email!)){
              return "Invalid Email";
            }
            return null;
          },
        ),
        const SizedBox(height: 8,),
        AuthTextField(
          prefixIcon: Icons.lock,
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
          textController: blocController.passwordController,
          labelText: "Password",
          floatingLabelBehavior: FloatingLabelBehavior.never,

        ),
        const SizedBox(height: 80,),
        GeneralButton(
          text: "Sign up",
          onPressed: blocController.signInRequest,
          elevation: 0.0,
          gradient: kLinearGradient,
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              GeneralText(
                text: "Already have an account? ",
                size: 17,
              ),
              GeneralText(
                text: "Login in",
                size: 17,
                color: kPrimaryColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
