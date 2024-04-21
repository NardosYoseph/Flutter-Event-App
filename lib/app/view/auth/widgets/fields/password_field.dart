import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

   PasswordTextField({
    Key? key,
    required this.controller,
    this.hintText = 'Password',
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
 bool _isObscure = true;

   void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

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
    return Container(
      height: 70,
      width: 350,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isObscure, // Hides the entered text
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: _togglePasswordVisibility,
          ),
               fillColor: Colors.white,
               filled: true,
               errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 1),borderRadius: BorderRadius.circular(10)),
         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1),borderRadius: BorderRadius.circular(10)),
        ),
        
        validator:  _validatePassword,
      ),
    );
  }
}
