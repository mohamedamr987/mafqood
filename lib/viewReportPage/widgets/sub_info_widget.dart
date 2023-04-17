import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/widgets/general_text.dart';

class SubInfoWidget extends StatelessWidget {
  final String title;
  final String value;
  const SubInfoWidget({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GeneralText(text: "$title: ", color: kPrimaryColor, size: 18,),
          Expanded(child: GeneralText(text: value, size: 18,),),
        ],
      ),
    );
  }
}
