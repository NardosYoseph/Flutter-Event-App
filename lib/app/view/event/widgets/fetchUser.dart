import 'package:event_app/app/controllers/user_conrollers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class FetchUser {
  UserController userController = Get.put(UserController());
    
Future<String?> getUserId() async {
  try {
   final storage = await FlutterSecureStorage();

    final String? accessToken = await storage.read(key:'accessToken');
    final Map<String?, dynamic> decodedToken = JwtDecoder.decode(accessToken!);
    return decodedToken['user']['_id'];
  } catch (error) {
    print('Error decoding token: $error');
    return null; // Or handle the error differently
  }
}
Future<void> fetchUser() async {
     final String? userId = await getUserId();
      if (userId != null) {
  await  userController.fetchUserById(userId); // Use userId if not null
  } else {
    // Handle case where userId is null (e.g., show error message)
  }
}
   
}