import 'package:flutter/material.dart';
import 'package:mafqood/widgets/general_text.dart';

class OptionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;
  final Color? iconColor;
  const OptionWidget({Key? key, required this.icon, required this.title, this.onTap, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: iconColor??const Color(0xFF1C1B1F), size: 30,),
            const SizedBox(width: 14,),
            GeneralText(text: title, size: 20, isBold: true,),
          ],
        ),
      ),
    );
  }
}
