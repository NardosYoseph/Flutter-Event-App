
import 'package:event_app/app/models/user/userModel.dart';
import 'package:get/get.dart';
import 'package:event_app/app/services/userService/user_service.dart';

class UserController extends GetxController{
  UserService _userService=UserService();
 late User singleUSer;
Future<User> fetchUserById(String id) async{
  singleUSer=await _userService.fetchUserById(id);
  return singleUSer;
}




}
