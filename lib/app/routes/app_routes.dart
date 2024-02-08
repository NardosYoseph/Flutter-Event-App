
import 'package:event_app/app/pages/auth/login_page.dart';
import 'package:event_app/app/pages/auth/registration_page.dart';
import 'package:event_app/app/pages/event_view.dart';
import 'package:event_app/app/pages/home_page.dart';
import 'package:event_app/app/pages/splash_screen.dart';
import 'package:get/get.dart';
part 'app_pages.dart';

class AppRoutes {
  static const INITIAL = Routes.LOGIN;
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.REGISTRATION, page: () => RegistrationPage()),
    GetPage(name: Routes.SPLASH_SCREEN, page: () => AnimatedSplashScreen()),
    GetPage(name: Routes.HOMEPAGE, page: () => HomePage()),
    GetPage(name: Routes.EventView, page: () => EventView()),

  ];
}
