import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:event_app/app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


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
  
  Future<bool> MultipartRequest(String endpoint,FormData formData, {Map<String, String>? headers,}) async {

  var request = http.MultipartRequest('POST', Uri.parse('$_baseUrl$endpoint'),)
    ..headers.addAll(headers!) 
    ..fields.addAll(Map.fromEntries(formData.fields));
var fileField = formData.files.first;
    var file = fileField.value;
    request.files.add(http.MultipartFile(
      fileField.key,
      file.finalize(),
      file.length, 
      filename: file.filename, 
    ));
print(request.fields);
  var response = await request.send();
  if (response.statusCode == 200) {
     return true;
} else {
  // Handle errors differently based on status code or response body
 
   print('Error adding event: ${response.statusCode} - ${response}');

  return false;
}
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

  dynamic _handleResponse(dynamic response) async {
  if (response is StreamedResponse) {
    final decodedBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return jsonDecode(decodedBody);
    } else {
      throw Exception('Failed to load data: $decodedBody');
    }
  } else if (response is http.Response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.body}');
    }
  } else {
    throw ArgumentError('Invalid response type: ${response.runtimeType}');
  }
}
}
