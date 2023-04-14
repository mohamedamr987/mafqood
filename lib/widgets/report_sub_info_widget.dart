import 'package:flutter/material.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/widgets/general_text.dart';

class ReportSubInfoWidget extends StatelessWidget {
  final String title;
  final String value;
  const ReportSubInfoWidget({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(text: "$title: ", size: 11, color: kPrimaryColor,),
        Expanded(child: GeneralText(text: value, size: 11, overflow: TextOverflow.ellipsis,),),
      ],
    );
  }
}
