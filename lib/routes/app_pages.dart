import 'package:get/get.dart';

import 'package:products/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:products/app/modules/authentication/views/authentication_view.dart';
import 'package:products/app/modules/home/bindings/home_binding.dart';
import 'package:products/app/modules/home/views/home_view.dart';
import 'package:products/app/modules/home/views/products_view.dart';
import 'package:products/app/modules/splash/bindings/splash_binding.dart';
import 'package:products/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
