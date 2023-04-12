import 'package:flutter_svg/flutter_svg.dart';
import 'package:mafqood/constants.dart';
import 'package:mafqood/size_config.dart';
import 'package:flutter/material.dart';

import '../controller.dart';
import '../widgets/on_boarding_main_widget.dart';

class OnBoardingSliderComponent extends StatelessWidget {
  const OnBoardingSliderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingPageController blocController = OnBoardingPageController.of(context);
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(75),),
        SvgPicture.asset("assets/logo_with_text.svg", color: kPrimaryColor,),
        const SizedBox(height: 10,),
        Container(
          constraints: BoxConstraints(
            minHeight: SizeConfig.screenHeight * 0.4,
            maxHeight: SizeConfig.screenHeight * 0.53,
          ),
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: blocController.sliderController,
            onPageChanged: blocController.onChangePageView,
            children: const [
              OnBoardingMainWidget(
                image: "1",
                text: "The application facilitates quick access to lost thing",
              ),
              OnBoardingMainWidget(
                image: "2",
                text: "You can upload a picture of a person , animal ,or lost things",
              ),
            ],
          ),
        )
      ],
    );
  }
}
