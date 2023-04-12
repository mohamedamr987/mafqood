import 'package:flutter/material.dart';

import '../constants.dart';
import '../core/services/pick_service.dart';
import 'general_text.dart';


class CameraOption extends StatelessWidget {
  final String text;
  final IconData icon;
  final PickService pickService;
  final Color color;
  const CameraOption({Key? key, required this.text, required this.icon, required this.pickService, this.color = kPrimaryColor,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var result = await pickService.call();
        Navigator.pop(context, result);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
            padding: const EdgeInsets.all(4,),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 38,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          GeneralText(
            text: text,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
