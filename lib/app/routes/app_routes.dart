
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/view/auth/pages/login_page.dart';
import 'package:event_app/app/view/auth/pages/registration_page.dart';
import 'package:event_app/app/view/event/pages/create_event_page.dart';
import 'package:event_app/app/view/event/pages/event_view.dart';
import 'package:event_app/app/view/event/pages/home_page.dart';
import 'package:event_app/app/view/event/pages/my_event_page.dart';
import 'package:event_app/app/view/event/pages/payment_page.dart';
import 'package:get/get.dart';
part 'app_pages.dart';

class AppRoutes {
  static const INITIAL = Routes.LOGIN;
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.REGISTRATION, page: () => RegistrationPage()),
    GetPage(name: Routes.HOMEPAGE, page: () => HomePage()),
    GetPage(name: Routes.EventView, page: () => EventView()),
    GetPage(name: Routes.CreateEvent, page: () => CreateEvent()),
    GetPage(name: Routes.PaymentPage, page: () => PaymentPage()),
    GetPage(name: Routes.MyEventsPage, page: () => MyEventPge()),



  ];
}
