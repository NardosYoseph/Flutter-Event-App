import 'package:event_app/app/models/event/eventModel.dart';

class User {
  String? id;
  final String username;
 String? profilePicture;
  final String email;
  final String password;
  final String role;
  List<String>? events;

  User({ this.id,required this.username,this.profilePicture, required this.email,required this.password, required this.role,this.events});

Map<String, dynamic> toJson() => {
    "_id":id,
    'username': username,
    'profilePicture':profilePicture,
    'email': email, 
    'password': password,
    'events': events,
    'role':role
  };

factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      profilePicture: json['profilePicture'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      events: json['tickets']
    );
  }}