import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'general_button.dart';
import 'general_text.dart';

class WarningAlertDialogWidget extends StatelessWidget {
  final String title;
  final Widget? button;
  final List<Widget>? actions;
  const WarningAlertDialogWidget ({Key? key, required this.title, this.button, this.actions,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
      title: Text(title,),
      titleTextStyle: const TextStyle( fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black,),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: button != null ? [
        GeneralButton(text: "Cancel", onPressed: ()=> Navigator.pop(context), width: 110, borderColor: kPrimaryColor, backgroundColor: Colors.white, textColor: kPrimaryColor,),
        button!,
      ] : actions,
    );
  }
}