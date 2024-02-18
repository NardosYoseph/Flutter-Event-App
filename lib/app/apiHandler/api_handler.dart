import 'dart:convert';
import 'dart:io';
import 'package:event_app/app/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static final ApiHandler _instance = ApiHandler._internal();

  factory ApiHandler() {
    return _instance;
  }

  ApiHandler._internal() {
    _baseUrl = eventsApiUrl;
  }

 late String _baseUrl;


  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl$endpoint'));
    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, dynamic data, {Map<String, String>? headers}) async {
    print("$data");
    final response = await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }
   Future<dynamic> MultipartRequest(String endpoint, dynamic data, {Map<String, String>? headers}) async {
    print("$data");
  // final bytes = await data.image.readAsBytes();
  //   final mimeType = mime(data.image.path);
  final request = http.MultipartRequest('POST', Uri.parse('$_baseUrl$endpoint'));
      if (headers != null) {
      request.headers.addAll(headers);
    }else{
      request.headers.addAll({'Content-Type': 'multipart/form-data'});
    }
    data.forEach((key, value) async {
      if (value is File) {
        request.files.add(http.MultipartFile.fromBytes(key, await value.readAsBytes(), filename: value.path));
      } else {
        request.fields[key] = value.toString();
      }
    });
  // // Send request
  final response = await request.send();

    return _handleResponse(response as http.Response);
  }

  Future<dynamic> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  Future<dynamic> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl$endpoint'));
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
