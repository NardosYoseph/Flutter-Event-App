import 'package:event_app/app/apiHandler/token_manager.dart';
import 'package:http_interceptor/http_interceptor.dart';

class RefreshTokenInterceptor  extends InterceptorContract {
late final TokenManager tokenManager;
//RefreshTokenInterceptor(this.tokenManager); 

  @override
 Future<BaseRequest> interceptRequest({required BaseRequest? request}) async {
    if (!request!.url.toString().contains('/login')||!request!.url.toString().contains('/register')) {

   final accessToken = await tokenManager.getAccessToken();
   request.headers['Authorization'] = 'Bearer $accessToken';}
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
     if (response.statusCode == 401) {
       try {
        await tokenManager.refreshToken();
        final refreshedRequest = await interceptRequest(request: response.request); // Reuse interceptRequest
        // Assuming no further processing on the refreshed request is needed
        return refreshedRequest as BaseResponse;
      } catch (e) {
        // Handle refresh token failure (e.g., logout user)
        throw Exception('Refresh token failed');
      }
    }
     

    return response ;
  }}

