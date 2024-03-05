import 'dart:convert';

import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();

  factory TokenManager() {
    return _instance;
  }

  TokenManager._internal();

  Future<String> getAccessToken() async {
    // Read access token from secure storage
    final storedToken = await getSecureStorageItem('accessToken');
    if (storedToken != null && !isAccessTokenExpired(storedToken)) {
      return storedToken;
    }
    return await refreshToken();
  }

  Future<String> refreshToken() async {
    final refreshToken = await getSecureStorageItem('refreshToken');
    final response = await ApiHandler().post("/refresh",{'refreshToken': refreshToken});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newAccessToken = data['accessToken'];
      await setSecureStorageItem('accessToken', newAccessToken);
      return newAccessToken;
    } else {
      // Handle refresh token failure (e.g., logout user)
      throw Exception('Refresh token failed');
    }
  }

  bool isAccessTokenExpired(String token) {
    return true;
    // Implement logic to check token expiry based on its format (e.g., JWT)
  }

  Future<String?> getSecureStorageItem(String key) async {
    final storage = await FlutterSecureStorage();
    return await storage.read(key: key);
  }

  Future<void> setSecureStorageItem(String key, String value) async {
    final storage = await FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }
}
