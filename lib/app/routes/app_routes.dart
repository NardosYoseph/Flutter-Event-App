
import 'package:event_app/app/pages/auth/login_page.dart';
import 'package:event_app/app/pages/auth/registration_page.dart';
import 'package:event_app/app/pages/splash_screen.dart';
import 'package:get/get.dart';
part 'app_pages.dart';

class AppRoutes {
  static const INITIAL = Routes.SPLASH_SCREEN;
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.REGISTRATION, page: () => RegistrationPage()),
    GetPage(name: Routes.SPLASH_SCREEN, page: () => AnimatedSplashScreen()),

  ];
}
