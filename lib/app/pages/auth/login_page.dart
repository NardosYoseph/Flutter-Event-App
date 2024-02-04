import 'package:event_app/app/controllers/auth_controller.dart';
import 'package:event_app/app/widgets/common/button.dart';
import 'package:event_app/app/widgets/common/text_field.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  final AuthController authController = Get.put(AuthController());

  TextEditingController emailController=TextEditingController();

  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 SizedBox(height: 10),
                  
                Center(
                  child: Container(
                  height: 400,
                  width: 400,
                    child: const FlareActor(
                    "assets/celebrate.flr", // Replace with your file path
                    fit: BoxFit.cover, // Adjust as needed
                    animation: "relig", // If animation has multiple layers
                    alignment: Alignment.center, // Align the animation
                  ),
                  ),
                ),
                 SizedBox(height: 10),
                  
                MyTextField(label: "Email", controller: emailController),
                 SizedBox(height: 10),
               MyTextField(label: "Password", controller: passwordController),
                SizedBox(height: 20),
             CustomizedButton(text: "Login", onPressed: (){authController.login(emailController.text, passwordController.text);}),
                     
                TextButton(
                  onPressed: () {
                    Get.toNamed('/registration');
                  },
                  child: Text('Don\'t have an account? Register here.'),
                ),
              ],
            ),
          )
                ),
    );
    
  }
}
