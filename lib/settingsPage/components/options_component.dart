import 'package:flutter/material.dart';
import 'package:mafqood/settingsPage/widgets/option_widget.dart';

class OptionsComponent extends StatelessWidget {
  const OptionsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionWidget(icon: Icons.edit, title: "Edit Profile", onTap: (){},),
        OptionWidget(icon: Icons.logout, title: "Log out", onTap: (){}, iconColor: Colors.red,),
      ],
    );
  }
}
