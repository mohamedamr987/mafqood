import 'package:flutter/material.dart';

import '../constants.dart';
import '../core/services/pick_image_service.dart';
import 'camera_option.dart';
import 'general_text.dart';



showCameraOptionsBottomSheet({
  required BuildContext context,
  bool isCameraEnabled = true,
  bool isFileEnabled = false,
  int count = 1,
  Color color = kPrimaryColor,
  bool haveEdit = true,
}) =>
    showModalBottomSheet(
      barrierColor: Colors.black26,
  context: context,
  builder: (BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8,),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children:  <Widget>[
              // if(isFileEnabled)
              //   CameraOption(
              //     color: color,
              //     text: LocaleKeys.file.tr(),
              //     icon: Icons.attach_file,
              //     pickService: PickFileService(),
              //   ),
              if(isCameraEnabled)
                CameraOption(
                  color: color,
                  text: "Camera",
                  icon: Icons.camera_alt,
                  pickService: PickImageService(pickImageMethod: PickImageMethod.camera, count: count, haveEdit: haveEdit,),
                ),
              CameraOption(
                color: color,
                text: "Gallery",
                pickService: PickImageService(pickImageMethod: PickImageMethod.gallery,  count: count, haveEdit: haveEdit,),
                icon: Icons.photo,
              ),

            ],
          ),
          const SizedBox(height: 12,),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: GeneralText(
                  text: "Cancel",
                  color: color,
                ),
              ),
        ],
      ),
    );
  },
);
