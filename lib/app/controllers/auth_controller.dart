import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool isLoggedIn = false.obs;

  void login(String username, String password) {
     Get.toNamed('/registration');
    isLoggedIn.value = true;
  }

  void register(String email, String password) {
    Get.toNamed('/registration');
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
