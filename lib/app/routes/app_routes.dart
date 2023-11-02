

import 'package:meat_shop/views/signup_page_view.dart';

import '../../views/login_page_view.dart';
import '../../views/splashscreen_view.dart';

class AppRoute{
  AppRoute._();
  
  static const String splashPageRoute = '/';
  static const String loginRoute = '/login';
  static const String homePageRoute = '/homepage';
  static const String signUpRoute = '/signup';

  static getApplicationRoute(){
    return{
      splashPageRoute: (context)=> const SplashScreens(),
      loginRoute: (context) => const LoginPageView(),
      signUpRoute: (context) => const SignUpPageView(),
    };
  }
}
