import 'package:flutter/material.dart';
import 'package:mafqood/widgets/cache_image_widget.dart';
import 'package:mafqood/widgets/general_text.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String image;
  const CategoryWidget({Key? key, required this.title, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: CacheImageWidget(image: image, fit: BoxFit.cover, width: 50, height: 50,),
          ),
          const SizedBox(height: 4,),
          GeneralText(text: title, size: 12, isBold: true,),
        ],
      ),
    );
  }
}
