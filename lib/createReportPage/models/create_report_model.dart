import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqood/widgets/snack_bar_shower.dart';

class CreateReportModel{
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController description = TextEditingController();
  String? category;
  XFile? pickedImage;
  final formKey = GlobalKey<FormState>();

  Future<void> pickImage() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(result != null){
      pickedImage = result;
    }
  }

  bool validate(){
    bool value = formKey.currentState!.validate() && category != null && pickedImage != null;
    if(!value) {
      snackBarShower("Please fill all fields");
    }
    return value;
  }

}