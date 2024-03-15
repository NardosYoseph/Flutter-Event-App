
import 'package:event_app/app/models/user/userModel.dart';
import 'package:get/get.dart';
import 'package:event_app/app/services/userService/user_service.dart';

class UserController extends GetxController{
  UserService _userService=UserService();
  User? singleUser ;
Future<User?> fetchUserById(String? id) async{
  singleUser=await _userService.fetchUserById(id);
  print(singleUser);
  return singleUser;
}
// String get username {
//     return singleUser.value?.username ?? ""; // Use safe navigation and default value
//   }
// String get email {
//     return singleUser.value?.email ?? ""; // Use safe navigation and default value
//   }

}
