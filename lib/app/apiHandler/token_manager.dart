import 'dart:convert';

import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();

  factory TokenManager() {
    return _instance;
  }

  TokenManager._internal();

  Future<String> getAccessToken() async {
    // Read access token from secure storage
    final storedToken = await getSecureStorageItem('accessToken');
    if (storedToken != null) {
      return storedToken;
    }
    return await refreshToken();
  }

  Future<String> refreshToken() async {
    // Make a request to the refresh token endpoint using your backend API
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
  Future<String?> getSecureStorageItem(String key) async {
    final storage = await FlutterSecureStorage();
    return await storage.read(key: key);
  }

  Future<void> setSecureStorageItem(String key, String value) async {
    final storage = await FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }
}
