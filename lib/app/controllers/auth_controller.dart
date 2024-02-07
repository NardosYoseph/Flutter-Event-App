import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool isLoggedIn = false.obs;
   String? Username;


  void login(String? email, String password) {
     email=Username;
     Get.toNamed('/homepage');
    isLoggedIn.value = true;
  }

  void register(String username,String email, String password) {
   
    Get.toNamed('/registration');
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
