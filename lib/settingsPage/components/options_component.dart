import 'package:flutter/material.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/editProfilePage/edit_profile_page_view.dart';
import 'package:mafqood/settingsPage/widgets/option_widget.dart';

class OptionsComponent extends StatelessWidget {
  const OptionsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionWidget(icon: Icons.edit, title: "Edit Profile", onTap: ()=> NavigationHelper.push(context, const EditProfilePageView()),),
        OptionWidget(icon: Icons.logout, title: "Log out", onTap: ()=> CoreInfo.logOut(), iconColor: Colors.red,),
      ],
    );
  }
}
