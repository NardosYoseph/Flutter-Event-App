import 'package:event_app/app/services/userService/auth_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool isLoggedIn = false.obs;
final AuthService _authService = AuthService(); // Create an instance of AuthService



  Future<void> login(String email, String password) async {
     try {
      // Call the registerUser method from AuthService
      final success = await _authService.login(email, password);
      if (success) {
      Get.toNamed("/homepage");
      } else { print('internal Error loging user');
      }
    } catch (error) {
      // Handle any exceptions
      print('Error registering user: $error');
    }
    isLoggedIn.value = true;
  }

  Future<void> register(String username,String email, String password) async {
   try {
      // Call the registerUser method from AuthService
      final success = await _authService.register(username, email, password);
      if (success) {
      Get.toNamed("/homepage");
      } else { print('internal Error registering user');
      }
    } catch (error) {
      // Handle any exceptions
      print('Error registering user: $error');
    }
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
