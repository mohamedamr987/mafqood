import 'package:flutter/material.dart';
import 'package:mafqood/onBoardingPage/components/buttons_component.dart';
import 'package:mafqood/widgets/main_layout_widget.dart';

import '../controller.dart';
import '../widgets/dot_indicator_widget.dart';
import 'on_boarding_slider_component.dart';


class OnBoardingPageScaffold extends StatelessWidget {
  const OnBoardingPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayoutWidget(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          OnBoardingSliderComponent(),
          ButtonsComponent(),
          DotIndicatorWidget(),
        ],
      ),
    );
  }
}
