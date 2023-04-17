import 'package:flutter/material.dart';
import 'package:mafqood/widgets/general_text.dart';

class InfoComponent extends StatelessWidget {
  const InfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        GeneralText(text: "Mohamed Amr", size: 20, isBold: true,),
        SizedBox(height: 10,),
        GeneralText(text: "mohamed.a.shaban24@gmail.com"),
      ],
    );
  }
}
