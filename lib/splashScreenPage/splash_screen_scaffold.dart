import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../size_config.dart';
import '../widgets/main_layout_widget.dart';

class SplashScreenScaffold extends StatefulWidget {
  const SplashScreenScaffold({Key? key}) : super(key: key);

  @override
  State<SplashScreenScaffold> createState() => _SplashScreenScaffoldState();
}

class _SplashScreenScaffoldState extends State<SplashScreenScaffold> {
  @override
  void initState() {
    super.initState();
    //this is the function which contains all the settings need to be done before starting the app
    delayingFunc();
  }

  void delayingFunc() async {
    try {

      // NavigationHelper.pushUntil(navigatorKey.currentContext!, CoreInfo.isLogged() ? const MainPageView() : const WelcomePageView(),);
    } catch (e, trace) {
      log(e.toString());
      log(trace.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MainLayoutWidget(
      backGroundColor: kPrimaryColor,
      isScrollable: false,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/logo_with_text.svg"),
        ],
      ),
    );
  }
}
