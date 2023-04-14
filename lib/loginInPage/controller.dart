import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/homePage/home_page_view.dart';
import 'package:mafqood/widgets/show_loading.dart';
import 'package:mafqood/widgets/snack_bar_shower.dart';
import '../constants.dart';
import '../main.dart';

import 'repo/login_repo.dart';
import 'state.dart';

class LoginInPageController extends Cubit<LoginInPageState>
{
  LoginInPageController() :super(LoginInPageInit());
  static LoginInPageController of(context)=> BlocProvider.of(context);

  LoginRepo loginRepo = LoginRepo();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signInRequest() async {
    if(formKey.currentState!.validate()){
      NavigationHelper.pushUntil(navigatorKey.currentContext!, const HomePageView(),);
      // showLoading();
      // final result = await loginRepo.login(emailController.text, passwordController.text,);
      // hideLoading();
      // result.fold(
      //   (l) => snackBarShower(l.message ?? kErrorText,),
      //   // (r) => NavigationHelper.pushUntil(navigatorKey.currentContext!, const MainPageView(),),
      //   (r) => null,
      // );
    }
  }
  // @override
  // Future<void> close() {
  //   phoneController.dispose();
  //   return super.close();
  // }
}