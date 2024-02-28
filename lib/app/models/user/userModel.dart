class User {
  String? id;
  final String username;
  final String email;
  final String password;

  User({ this.id,required this.username,required this.email,required this.password});

Map<String, dynamic> toJson() => {
    "_id":id,
    'username': username,
    'email': email, 
    'password': password,
  };

factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      
    );
  }}