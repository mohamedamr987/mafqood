import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/loginInPage/login_in_page_view.dart';
import 'package:mafqood/main.dart';
import 'state.dart';

class OnBoardingPageController extends Cubit<OnBoardingPageState>
{
  OnBoardingPageController() :super(OnBoardingPageInit());
  static OnBoardingPageController of(context)=> BlocProvider.of(context);
  double dotIndicatorPosition =0 ;
  PageController sliderController = PageController();
  void onChangePageView(int index)
  {
    dotIndicatorPosition = index.toDouble();
    emit(OnBoardingPageInit());
  }
  void onPressedNextButton() async
  {
    sliderController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.fastOutSlowIn,);
    if(sliderController.page == 1.0){
      NavigationHelper.pushUntil(navigatorKey.currentContext!, const LoginInPageView());
    }
  }
}