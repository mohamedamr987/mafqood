import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/widgets/show_loading.dart';
import 'package:mafqood/widgets/snack_bar_shower.dart';
import '../constants.dart';
import '../main.dart';

import '../navigationPage/navigation_page_view.dart';
import 'repo/sign_up_repo.dart';
import 'state.dart';

class SignUpPageController extends Cubit<SignUpPageState>
{
  SignUpPageController() :super(SignUpPageInit());
  static SignUpPageController of(context)=> BlocProvider.of(context);

  SignUpRepo signUpRepo = SignUpRepo();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signInRequest() async {
    if(formKey.currentState!.validate()){
      showLoading();
      final result = await signUpRepo.signUp(emailController.text, passwordController.text, fullNameController.text,);
      hideLoading();
      result.fold(
        (l) => snackBarShower(l.message ?? kErrorText,),
        (r) => NavigationHelper.pushUntil(navigatorKey.currentContext!, const NavigationPageView(),),
      );
    }
  }
  // @override
  // Future<void> close() {
  //   phoneController.dispose();
  //   return super.close();
  // }
}