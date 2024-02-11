import 'dart:ui';

import 'package:event_app/app/controllers/user_conrollers/auth/auth_controller.dart';
import 'package:event_app/app/view/auth/widgets/forms/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
 TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
 TextEditingController usernameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
          Stack(
            children: [
              Container(height: double.infinity,width: double.infinity,margin: EdgeInsets.all(0),
              child: Stack(
            children: [
              Image.asset(
                "assets/event5.jpg",
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
          RegistrationForm()
         ] )
                ),
    );
 
  }
}
