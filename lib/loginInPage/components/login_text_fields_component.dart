import 'package:flutter/material.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/widgets/auth_text_field.dart';
import 'package:mafqood/widgets/general_button.dart';
import 'package:mafqood/widgets/general_text.dart';

import '../../constants.dart';
import '../../core/validation/email_validation.dart';
import '../controller.dart';

class LoginTextFieldsComponent extends StatelessWidget {
  const LoginTextFieldsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginInPageController blocController = LoginInPageController.of(context);
    return Column(
      children: [
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
        const SizedBox(height: 8,),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              // NavigationHelper.push(context, const ForgotPasswordPageView());
            },
            child: const GeneralText(
              text: "Forgot your Password?",
              color: kPrimaryColor,
            ),
          ),
        ),
        const SizedBox(height: 110,),
        GeneralButton(
          text: "LOGIN",
          onPressed: blocController.signInRequest,
          elevation: 0.0,
          gradient: kLinearGradient,
        ),
        GestureDetector(
          onTap: () {
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              GeneralText(
                text: "Don't have an account? ",
                size: 17,
              ),
              GeneralText(
                text: "Sign Up",
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
