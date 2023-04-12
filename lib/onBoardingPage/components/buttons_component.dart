import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/loginInPage/login_in_page_view.dart';
import 'package:mafqood/onBoardingPage/controller.dart';
import 'package:mafqood/widgets/general_button.dart';

class ButtonsComponent extends StatelessWidget {
  const ButtonsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingPageController blocController = BlocProvider.of(context);
    const LinearGradient linearGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xff4BDFFF),
        Color(0xff4F53C2),
      ],
    );
    return BlocBuilder(
      bloc: blocController,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(blocController.dotIndicatorPosition == 0.0)
              GeneralButton(
                text: "Skip",
                onPressed: ()=> NavigationHelper.pushUntil(context, const LoginInPageView()),
                width: 100,
                gradient: linearGradient,
              )
            else
              const SizedBox(),
            GeneralButton(
              text: "Next",
              onPressed: blocController.onPressedNextButton,
              width: 100,
              gradient: linearGradient,
            ),
          ],
        );
      },
    );
  }
}
