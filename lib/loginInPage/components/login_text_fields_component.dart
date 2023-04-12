import 'package:flutter/material.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/widgets/auth_text_field.dart';
import 'package:mafqood/widgets/general_button.dart';
import 'package:mafqood/widgets/general_text.dart';

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
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
          textController: blocController.passwordController,
          labelText: "Password",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: const Color(0xFFCCCCCC).withOpacity(0.2),
        ),
        const SizedBox(height: 40,),
        GeneralButton(
          text: "LOGIN",
          onPressed: blocController.signInRequest,
          elevation: 0.0,
        ),
        const SizedBox(height: 53,),
        GestureDetector(
          onTap: () {
            // NavigationHelper.push(context, const ForgotPasswordPageView());
          },
          child: const GeneralText(
            text: "Forgot your Password?",
            isBold: true,
          ),
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
