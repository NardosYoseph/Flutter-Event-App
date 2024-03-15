import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/models/user/userModel.dart';

class UserService{
  Future<User> fetchUserById(String? id) async{
 final response = await ApiHandler().post("/user/singleUser", {"id": id});
  if (response != null) {
    print(response);
    final userData=response['user'];
     final user = User.fromJson(userData); 
    return user;
     // Cast and convert
  } else {
    // Handle case where response is null (e.g., throw error)
    throw Exception('Error fetching user');
  }}
}