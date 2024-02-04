import 'package:event_app/app/controllers/auth_controller.dart';
import 'package:event_app/app/widgets/common/button.dart';
import 'package:event_app/app/widgets/common/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flare_flutter/flare_actor.dart';

class RegistrationPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
 TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
             CustomizedButton(text: "Register", onPressed: (){authController.register(emailController.text, passwordController.text);}),
                     
                TextButton(
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: Text('Already have an account? Login here.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
