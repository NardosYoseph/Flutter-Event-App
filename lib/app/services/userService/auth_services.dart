import 'dart:convert';
import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/models/user/userModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants.dart';
class AuthService {

  Future<Object> login(String email, String password) async {
    final response = await ApiHandler().post("/user/login",{});
      return response;
  }

  Future<bool> register(User user) async {
    final response = await ApiHandler().post("/user/register", user);
    return response;
    
  }

  Future<void> logout() async {
    // Make a DELETE request to the logout endpoint
    await http.delete(Uri.parse('$eventsApiUrl/logout'));
    // Perform any other necessary tasks for logout
  }

}