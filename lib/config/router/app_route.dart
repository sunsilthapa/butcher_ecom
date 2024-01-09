
import 'package:meat_shop/features/auth/presentation/view/login_view.dart';
import 'package:meat_shop/features/auth/presentation/view/register_view.dart';
import 'package:meat_shop/features/home/presentation/view/home_view.dart';
import 'package:meat_shop/features/splashscreen_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String batchStudentRoute = '/batchStudent';
  static const String googleMapRoute = '/googleMap';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashScreens(),
      loginRoute: (context) => const LoginView(),
      homeRoute: (context) => const HomeView(),
      registerRoute: (context) => const RegisterView(),
      // batchStudentRoute: (context) => const BatchStudentView(null),
      // googleMapRoute: (context) => const GoogleMapView(),
    };
  }
}
