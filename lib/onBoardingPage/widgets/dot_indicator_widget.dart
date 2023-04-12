import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/constants.dart';

import '../controller.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingPageController blocController = OnBoardingPageController.of(context);
    return BlocBuilder(
      bloc: blocController,
      builder: (context,state) {
        return DotsIndicator(
          dotsCount: 2,
          position: blocController.dotIndicatorPosition,
          decorator: DotsDecorator(
            activeColor: kPrimaryColor,
            color: kPrimaryColor.withOpacity(0.5),
            size: const Size.square(11.0),
            activeSize: const Size.square(13.0),
            
          ),
        );
      }
    );
  }
}
