import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/models/user/userModel.dart';

class UserService{
  Future<User> fetchUserById(String? id) async{
 final response = await ApiHandler().post("/user/singleUser", {"id": id});
  if (response != null) {
    print(response);
    final userData=response['user'];
     final user = User.fromJson(userData); 
    return user;
  } else {
    throw Exception('Error fetching user');
  }}

  Future<List<Event>> findUserEvents(String? userId) async{
    print(userId);
 final response = await ApiHandler().get('/user/findUserEvents/$userId');
  if (response != null) {
    print(response);
      List<Event> events = (response['events'] as List<dynamic>)
        .map((json) => Event.fromJson(json))
        .toList();
    return events;
  } else {
    throw Exception('Error fetching user');
  }}
}