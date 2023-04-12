import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/widgets/general_text.dart';

import '../../widgets/general_app_bar_widget.dart';
import '../../widgets/main_layout_widget.dart';
import '../controller.dart';
import 'login_text_fields_component.dart';

class LoginInPageScaffold extends StatelessWidget {
  const LoginInPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginInPageController blocController = LoginInPageController.of(context);
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      widthMargin: 30,
      widget: Form(
        key: blocController.formKey,
        child: Column(
          children: [
            const SizedBox(height: 25,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(width: double.infinity,),
                GeneralText(text: "Welcome back", size: 34, isBold: true, color: kPrimaryColor,),
                SizedBox(height: 10,),
                GeneralText(text: "Sign In Now", size: 17,),
                SizedBox(height: 70,),
              ],
            ),
            const LoginTextFieldsComponent(),
          ],
        ),
      ),
    );
  }
}
