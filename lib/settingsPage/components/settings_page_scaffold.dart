import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/settingsPage/components/info_component.dart';
import 'package:mafqood/settingsPage/components/options_component.dart';

import '../../widgets/main_layout_widget.dart';

class SettingsPageScaffold extends StatelessWidget {
  const SettingsPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      backGroundColor: Colors.white,
      widthMargin: 0,
      widget: Column(
        children: [
          const SizedBox(width: double.infinity,),
          const SizedBox(height: 25,),
          SvgPicture.asset("assets/logo_with_text.svg", color: kPrimaryColor, width: 137,),
          const SizedBox(height: 40,),
          const InfoComponent(),
          const SizedBox(height: 200,),
          const OptionsComponent(),
        ],
      ),
    );
  }
}
