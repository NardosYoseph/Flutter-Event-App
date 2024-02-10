import 'dart:ui';

import 'package:event_app/app/controllers/auth/auth_controller.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:event_app/app/view/auth/widgets/fields/email_field.dart';
import 'package:event_app/app/view/auth/widgets/fields/password_field.dart';
import 'package:event_app/app/view/event/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flare_flutter/flare_actor.dart';

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
          ), ),  Center(
                child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       SizedBox(height: 30),
                       TextField(controller: usernameController,decoration: InputDecoration(hintText: "Username",),),
                       SizedBox(height: 10),
                       EmailTextField(controller: emailController),
                        SizedBox(height: 10),
                        PasswordTextField(controller: passwordController),
                      SizedBox(height: 20),
                   CustomizedButton(text: "Register", onPressed: (){authController.register(usernameController.text,emailController.text, passwordController.text);

                   }),
                           
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/login');
                        },
                        child: TextUtil(text: "Already have an account? login.")
                      ),
                    ],
                  ),
                ),
                            ),
              ),
         ] )
                ),
    );
 
  }
}
