import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class TokenInterceptor implements http.BaseClient {
  final http.Client _inner = http.Client();
  late String _accessToken;
  late String _refreshToken;
  late String _refreshEndpoint;

  TokenInterceptor(String accessToken, String refreshToken, String refreshEndpoint) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _refreshEndpoint = refreshEndpoint;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Add authorization header with access token to the request
    request.headers['Authorization'] = 'Bearer $_accessToken';

    final response = await _inner.send(request);

    // Check if the response indicates token expiration
    if (response.statusCode == 401) {
      // Refresh the token
      await _refreshTokenIfNeeded();

      // Retry the original request with the new token
      request.headers['Authorization'] = 'Bearer $_accessToken';
      return _inner.send(request);
    }

    return response;
  }

  Future<void> _refreshTokenIfNeeded() async {
    // Implement token refresh logic here
    // For example:
    // final response = await http.post(_refreshEndpoint, body: {'refresh_token': _refreshToken});
    // final newAccessToken = response.body['access_token'];
    // final newRefreshToken = response.body['refresh_token'];
    // _accessToken = newAccessToken;
    // _refreshToken = newRefreshToken;

    // Example:
    // final response = await http.post(_refreshEndpoint, body: {'refresh_token': _refreshToken});
    // final data = json.decode(response.body);
    // _accessToken = data['access_token'];
  }

  @override
  void close() => _inner.close();

  @override
  Future<http.Response> delete(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<http.Response> head(Uri url, {Map<String, String>? headers}) {
    // TODO: implement head
    throw UnimplementedError();
  }

  @override
  Future<http.Response> patch(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<http.Response> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<http.Response> put(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    // TODO: implement readBytes
    throw UnimplementedError();
  }
}
