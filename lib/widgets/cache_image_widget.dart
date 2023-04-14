import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CacheImageWidget extends StatelessWidget {
  final String? image;
  final BoxFit fit;
  final double? height;
  final double? width;
  final bool showLoading;
  const CacheImageWidget({Key? key, required this.image,required this.fit, this.height, this.width, this.showLoading = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(image == null || image == ""){
      return Image.asset("assets/person.png",height: height, width: width , fit: fit,);
    }
    return CachedNetworkImage(
      fit: fit ,
      imageUrl:image!,
      height: height,
      width: width ,
      progressIndicatorBuilder: showLoading? (context, url, downloadProgress) =>
          Center(child: CircularProgressIndicator(value: downloadProgress.progress,)) : null,
      errorWidget: (context, url, error) => const Icon(Icons.error,color: kPrimaryColor,),
    );
  }
}

