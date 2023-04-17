import 'package:flutter/material.dart';
import 'package:mafqood/widgets/cache_image_widget.dart';

class ReportImageComponent extends StatelessWidget {
  const ReportImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const CacheImageWidget(
        image: "https://childmind.org/wp-content/uploads/2021/07/our-impact-header-half-r.jpg",
        fit: BoxFit.fill,
      ),
    );
  }
}
