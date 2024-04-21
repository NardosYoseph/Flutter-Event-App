import 'package:event_app/app/controllers/user_conrollers/auth/auth_controller.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:event_app/app/view/auth/widgets/fields/email_field.dart';
import 'package:event_app/app/view/auth/widgets/fields/password_field.dart';
import 'package:event_app/app/view/event/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
   LoginForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final AuthController authController = Get.put(AuthController());

  TextEditingController emailController=TextEditingController();

  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
                child: SingleChildScrollView(
                child: Form(
                     key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         SizedBox(height: 30),
                         EmailTextField(controller: emailController,email: emailController.text,),
                         SizedBox(height: 10),
                         PasswordTextField(controller: passwordController),
                        SizedBox(height: 20),
                    CustomizedButton(
                    text: "Login",
                    onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                          
                      authController.login(
                        emailController.text,
                        passwordController.text,
                      );
                    
                     } },
                  ),
                                 SizedBox(height: 20),

                    Obx(() {
                          return Text(authController.loginError.value,style: TextStyle(color: Colors.red), );
                      }),
                   
                                 SizedBox(height: 20),
                      
                        TextButton(onPressed: (){
             
                          Get.toNamed('/registration');
                    }, child: TextUtil(text: "Don\'t have an account? Register here.")) 
                    
                      ],
                    ),
                  ),
                ),
                            ),
              );
  }
}