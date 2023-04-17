import 'package:flutter/material.dart';

class EditProfileTextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool isPassword;
  const EditProfileTextFieldWidget({Key? key, required this.title, required this.textEditingController, required this.keyboardType, this.isPassword = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: (String? text){
        if(text! == '') {
          return "Please enter $title";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }
}
