// import 'package:event_app/app/apiHandler/token_manager.dart';
// import 'package:http_interceptor/http_interceptor.dart';

// class RefreshTokenInterceptor implements InterceptorContract {
//   @override
//   Future<RequestData> interceptRequest({required RequestData data}) async {
//     // Access your TokenManager here (assuming you have one)
//     final tokenManager = TokenManager();
//     final accessToken = await tokenManager.getAccessToken();

//     // Set the authorization header if an access token is available
//     if (accessToken != null) {
//       data.headers['Authorization'] = 'Bearer $accessToken';
//     }

//     return data;
//   }

//   @override
//   Future<ResponseData> interceptResponse({required ResponseData data}) async {
//     if (data.statusCode == 401) {
//       final tokenManager = TokenManager();
//       try {
//         await tokenManager.refreshToken();
//         // Reconstruct the request with the new access token
//         final refreshedRequestData = RequestData.from(data.request);
//         refreshedRequestData.headers['Authorization'] = 'Bearer ${await tokenManager.getAccessToken()}';

//         // Retry the request
//         final newResponseData = await HttpInterceptors().resolve(RequestData.from(refreshedRequestData));
//         return newResponseData;
//       } catch (e) {
//         // Handle refresh token failure (e.g., logout user)
//         throw Exception('Refresh token failed');
//       }
//     }
//     return data;
//   }
// }
