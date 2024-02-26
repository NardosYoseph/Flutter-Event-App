import 'dart:convert';
import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/models/user/userModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants.dart';

class AuthService {

  Future<Object> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await ApiHandler().post("/user/login",{"email":email,"password":password});
    await prefs.setString('token', response['token']);
    String? token= prefs.getString('token');
    ApiHandler().setAuthorization(token!);
      return response;
  }

  Future<bool?> register(User user) async {

    final response = await ApiHandler().post("/user/register", user.toJson());
     if (response is bool) {
      return response;
    } else if (response is Map<String, dynamic>) {
      return response['success'] == true;
    }
    return null;
    
  }

  Future<void> logout() async {
    // Make a DELETE request to the logout endpoint
    await http.delete(Uri.parse('$eventsApiUrl/logout'));
    // Perform any other necessary tasks for logout
  }

}