import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
 late String email;
   EmailTextField({
    Key? key,
    required this.controller, 
    required this.email
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 70,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: 
            InputDecoration(
              hintText: "Email",
               errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 1),borderRadius: BorderRadius.circular(10)),
     
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white, 
                  width:  1,
                ),
              ),
              filled: true, 
              fillColor: Colors.white,
            ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter an email';
          }
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null; 
        },
        onSaved:(value) => email = value!,
      ),
    );
  }
}
