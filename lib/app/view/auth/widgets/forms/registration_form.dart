import 'package:event_app/app/controllers/user_conrollers/auth/auth_controller.dart';
import 'package:event_app/app/models/user/userModel.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:event_app/app/view/auth/widgets/fields/email_field.dart';
import 'package:event_app/app/view/auth/widgets/fields/password_field.dart';
import 'package:event_app/app/view/event/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationForm extends StatelessWidget {
  RegistrationForm({super.key});

  final AuthController authController = Get.put(AuthController());
 TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
 TextEditingController usernameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
                child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       SizedBox(height: 30),
                       Container(
                        height: 50,
                        width: 350,
                         child: TextFormField(controller: usernameController,decoration: InputDecoration(hintText: "Username",fillColor: Colors.white,filled: true, // Fill the background with fillColor
                         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 3),borderRadius: BorderRadius.circular(10),)),
                         ),
                       ),
                       SizedBox(height: 10),
                       EmailTextField(controller: emailController),
                        SizedBox(height: 10),
                        PasswordTextField(controller: passwordController),
                      SizedBox(height: 20),
                   CustomizedButton(text: "Register", onPressed: (){
                    User user = User(
                            username: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            events: [],
                            role:"USER"
                          );
                    authController.register(user);

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
              );
  }
}