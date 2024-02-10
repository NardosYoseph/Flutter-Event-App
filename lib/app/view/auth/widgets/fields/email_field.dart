import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? textStyle;
  final InputDecoration? decoration;

  const EmailTextField({
    Key? key,
    required this.controller,
    this.hintText = 'Email',
    this.textStyle,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: decoration ??
          InputDecoration(
            hintText: hintText,
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
      style: textStyle,
      // Add validation logic to ensure email format
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email';
        }
        // Use a regex pattern to validate email format
        // This is a simple pattern, you can use a more complex one for stricter validation
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null; // Return null if the input is valid
      },
    );
  }
}
