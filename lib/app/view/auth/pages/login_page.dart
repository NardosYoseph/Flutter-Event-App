import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/view/auth/widgets/forms/login_form.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
 @override
  void initState() {
    super.initState();
    hello();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
          Stack(
            children: [
              Container(height: double.infinity,width: double.infinity,margin: EdgeInsets.all(0),
              color: Colors.white,
              child: Stack(
            children: [
              Image.asset(
                "assets/event6.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX:3, sigmaY: 3), // Adjust sigmaX and sigmaY for blur intensity
                child: Container(
                  color: Colors.black.withOpacity(0), // You can change the color and opacity as needed
                ),
              ),
            ],
          ), ),  
          LoginForm()
         ] 
         ),
       
                ),
    );
    
  }
}
Future<Object> hello() async{
Map<String, dynamic> response= await ApiHandler().hello('/user/hello');
print(response);
return response;
}