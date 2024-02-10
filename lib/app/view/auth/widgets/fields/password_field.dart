import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordTextField({
    Key? key,
    required this.controller,
    this.hintText = 'Password',
  }) : super(key: key);

 String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null; // Return null if validation passes
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true, // Hides the entered text
      decoration: InputDecoration(
        hintText: hintText,
        labelText: 'Password', 
        
        border: OutlineInputBorder(),
      ),
      validator:  _validatePassword,
    );
  }
}
