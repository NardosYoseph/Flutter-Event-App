import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/models/user/userModel.dart';

class UserService{
  Future<User> fetchUserById(String id) async{
final User user=await ApiHandler().post("/user", {"id":id});
    return user;
  }
}