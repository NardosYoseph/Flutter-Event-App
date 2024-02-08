import 'package:http/http.dart' as http;
import '../utils/constants.dart';
class AuthService {

  Future<bool> login(String email, String password) async {
    // Make a POST request to the login endpoint
    final response = await http.post(
      Uri.parse('$eventsApiUrl/login'),
      body: {'email': email, 'password': password},
    );
    
    if (response.statusCode == 200) {
      return true; // Successful login
    } else {
      // Handle errors
      return false; // Failed login
    }
  }

  Future<bool> register(String username, String email, String password) async {
    // Make a POST request to the registration endpoint
    final response = await http.post(
      Uri.parse('$eventsApiUrl/register'),
      body: {'username': username, 'email': email, 'password': password},
    );

    // Check if the request was successful and handle the response
    if (response.statusCode == 200) {
      // Parse response if needed
      // Example: final responseData = json.decode(response.body);
      return true; // Successful registration
    } else {
      // Handle errors
      return false; // Failed registration
    }
  }

  Future<void> logout() async {
    // Make a DELETE request to the logout endpoint
    await http.delete(Uri.parse('$eventsApiUrl/logout'));
    // Perform any other necessary tasks for logout
  }
}
