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
    await prefs.setString('token', response['token']['accessToken']);
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

 Future<List<User>> fetchUsers() async {
    final response = await ApiHandler().get("/user/allUSers");
    if (response.containsKey('userList')) {
    List<User> users = (response['userList'] as List<dynamic>)
        .map((json) => User.fromJson(json))
        .toList();
    return users;
     } else {
    throw Exception('Failed to fetch users');
  }
  }

   Future<User> fetchUserbyID(String? id) async {
    final response = await ApiHandler().get("/user/allUSers/$id");
    if (response.containsKey('user')) {
    User user = User.fromJson(response);
    return user;
     } else {
    throw Exception('Failed to fetch users');
  }
  }


  Future<void> logout() async {
    // Make a DELETE request to the logout endpoint
    await http.delete(Uri.parse('$eventsApiUrl/logout'));
    // Perform any other necessary tasks for logout
  }

}