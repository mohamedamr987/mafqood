import 'package:flutter/material.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/widgets/general_text.dart';

class InfoComponent extends StatelessWidget {
  const InfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GeneralText(text: CoreInfo.auth.currentUser!.displayName!, size: 20, isBold: true,),
        SizedBox(height: 10,),
        GeneralText(text: CoreInfo.auth.currentUser!.email!),
      ],
    );
  }
}
