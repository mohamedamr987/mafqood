import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafqood/widgets/general_text.dart';

class OnBoardingMainWidget extends StatelessWidget {
  final String image;
  final String text;
  const OnBoardingMainWidget({Key? key,required this.image, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/on_boarding$image.svg",width: double.infinity, height: 350,),
        GeneralText(text: text,textAlign: TextAlign.center,),
      ],
    );
  }
}
