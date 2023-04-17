import 'package:flutter/material.dart';
import 'package:mafqood/widgets/general_text.dart';
import 'package:timeago/timeago.dart' as timeago;

class PreviousChatWidget extends StatelessWidget {
  const PreviousChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16,),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                GeneralText(text: "Mohamed Kamel", size: 16, isBold: true,),
                SizedBox(height: 5,),
                GeneralText(text: "Hello, how are you?", size: 14, color: Colors.grey,),
              ],
            ),
          ),
          GeneralText(text: timeago.format(DateTime.now())),
        ],
      ),
    );
  }
}
