// import 'package:influencer_academy/core/helpers/navigation_helper.dart';
// import 'package:influencer_academy/core/repo/bearer_token_repo.dart';
// import 'package:influencer_academy/main.dart';
// import 'package:influencer_academy/welcomePage/welcome_page_view.dart';
//
// import 'helpers/dio_helper.dart';
// import 'models/user.dart';
// import 'repo/profile_repo.dart';
//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mafqood/core/helpers/navigation_helper.dart';
import 'package:mafqood/core/models/category_model.dart';
import 'package:mafqood/homePage/repo/home_repo.dart';
import 'package:mafqood/loginInPage/login_in_page_view.dart';

import '../main.dart';
import 'models/logged_user_model.dart';

class CoreInfo{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static List<CategoryModel> categories = [];
  static Future<void> init() async{
    await getCategories();
  }

  static Future<void> getCategories() async{
    final result = await HomeRepo().getCategories();
    result.fold(
      (l) => print(l.message),
      (r) => categories = r,
    );
  }
  static bool isLogged(){
    return FirebaseAuth.instance.currentUser != null;
  }

  static Future<void> logOut() async{
    await FirebaseAuth.instance.signOut();
    NavigationHelper.pushUntil(navigatorKey.currentContext!, const LoginInPageView());
  }
}