import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqood/core/core_info.dart';
import 'package:mafqood/core/models/category_model.dart';
import 'package:mafqood/core/repo/image_repo.dart';
import 'package:mafqood/widgets/snack_bar_shower.dart';

class CreateReportModel{
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController description = TextEditingController();
  CategoryModel? category;
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



  Future<Map<String,dynamic>> toJson() async {
    return {
      "name": name.text,
      "age": age.text,
      "place": place.text,
      "description": description.text,
      "category_id": category!.id,
      "image": await ImageRepo().uploadImageToFirebase(pickedImage!),
      "user_uid": CoreInfo.auth.currentUser!.uid
    };
  }
}