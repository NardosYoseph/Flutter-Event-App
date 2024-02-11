import 'dart:convert';
import 'package:event_app/app/models/user/userModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
class AuthService {

  Future<bool> login(String email, String password) async {
    // Make a POST request to the login endpoint
    final response = await http.post(
      Uri.parse('$eventsApiUrl/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    
    if (response.statusCode == 200) {
      return true; // Successful login
    } else {
      // Handle errors
      return false; // Failed login
    }
  }

  Future<bool> register(User user) async {
    // Make a POST request to the registration endpoint
    print("data"+user.email);
    final response = await http.post(
      Uri.parse('$eventsApiUrl/user/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': user.username,'email':user.email,"password":user.password}),
    );
print(response.body);
    // Check if the request was successful and handle the response
    if (response.statusCode == 200) {
     return true;}
     else{
      print("not 200 code");
      return false; // Failed registration
    }
    
  }
  }

  Future<void> logout() async {
    // Make a DELETE request to the logout endpoint
    await http.delete(Uri.parse('$eventsApiUrl/logout'));
    // Perform any other necessary tasks for logout
  }

