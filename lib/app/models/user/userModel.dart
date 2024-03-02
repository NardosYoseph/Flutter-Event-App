class User {
  String? id;
  final String username;
 String? profilePicture;
  final String email;
  final String password;
  final double tickets;

  User({ this.id,required this.username,this.profilePicture, required this.email,required this.password,required this.tickets});

Map<String, dynamic> toJson() => {
    "_id":id,
    'username': username,
    'profilePicture':profilePicture,
    'email': email, 
    'password': password,
    'tickets': tickets
  };

factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      profilePicture: json['profilePicture'],
      email: json['email'],
      password: json['password'],
      tickets: json['tickets']
    );
  }}