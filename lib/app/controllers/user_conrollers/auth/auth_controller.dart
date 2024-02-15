import 'package:event_app/app/models/user/userModel.dart';
import 'package:event_app/app/services/userService/auth_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
final AuthService _authService = AuthService(); // Create an instance of AuthService



  Future<void> login(String email, String password) async {
     try {
      // Call the registerUser method from AuthService
      final success = await _authService.login(email, password);
      print(success);
    Get.toNamed("/homepage");
        } catch (error) {
      // Handle any exceptions
      print('Error logging user: $error');
    }
  }

  Future<void> register(User user) async {
   try {
      // Call the registerUser method from AuthService
      final success = await _authService.register(user);
      if (success) {
      Get.toNamed("/login");
      } else { print('internal Error registering user');
      }
    } catch (error) {
      // Handle any exceptions
      print('Error registering user: $error');
    }
  }

  void logout() {
  }
}
