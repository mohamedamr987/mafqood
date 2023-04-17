import 'package:flutter/material.dart';
import 'package:mafqood/widgets/general_text.dart';

import '../../constants.dart';

class TipsComponent extends StatelessWidget {
  const TipsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        GeneralText(text: "Tips:", color: kPrimaryColor, isBold: true,),
        SizedBox(height: 8,),
        GeneralText(text: "Never Choose any sensitive place for meeting to get your thing back. Always choose a natural public place."),
      ],
    );
  }
}
