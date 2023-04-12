import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/loginInPage/login_in_page_view.dart';
import 'package:mafqood/onBoardingPage/controller.dart';
import 'package:mafqood/widgets/general_button.dart';

import '../../constants.dart';

class ButtonsComponent extends StatelessWidget {
  const ButtonsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoardingPageController blocController = BlocProvider.of(context);

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
                gradient: kLinearGradient,
              )
            else
              const SizedBox(),
            GeneralButton(
              text: "Next",
              onPressed: blocController.onPressedNextButton,
              width: 100,
              gradient: kLinearGradient,
            ),
          ],
        );
      },
    );
  }
}
