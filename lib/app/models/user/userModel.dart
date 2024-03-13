import 'package:event_app/app/models/event/eventModel.dart';

class User {
  String? id;
  final String username;
 String? profilePicture;
  final String email;
  final String password;
  List<String>? events;

  User({ this.id,required this.username,this.profilePicture, required this.email,required this.password, this.events});

Map<String, dynamic> toJson() => {
    "_id":id,
    'username': username,
    'profilePicture':profilePicture,
    'email': email, 
    'password': password,
    'events': events
  };

factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      profilePicture: json['profilePicture'],
      email: json['email'],
      password: json['password'],
      events: json['tickets']
    );
  }}