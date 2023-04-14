import 'package:flutter/material.dart';
import 'package:mafqood/widgets/general_text.dart';
import 'package:mafqood/widgets/report_widget.dart';

class RecentlyComponent extends StatelessWidget {
  const RecentlyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GeneralText(text: "Recently", size: 20, isBold: true,),
          const SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 20,
              children: List.generate(20, (index) => const ReportWidget()),
            ),
          )
        ],
      ),
    );
  }
}
