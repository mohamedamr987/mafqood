import 'package:image_picker/image_picker.dart';

import 'pick_service.dart';



enum PickImageMethod{camera, gallery}
class PickImageService implements PickService{
  PickImageMethod pickImageMethod;
  final ImagePicker _picker = ImagePicker();
  int count;
  bool haveEdit;
  PickImageService({required this.pickImageMethod, this.count = 1, this.haveEdit = true,});


  @override
  Future<XFile?> call() async {
    XFile? pickedImage;
    if(pickImageMethod == PickImageMethod.camera)
     {
      pickedImage = await _picker.pickImage(source: ImageSource.camera);
    }
    else{
      pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    }
    if(pickedImage !=null){
      return pickedImage ;
    }
    else {
      return null;
    }
  }

}
