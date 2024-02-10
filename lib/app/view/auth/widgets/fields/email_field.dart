import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({
    Key? key,
    required this.controller, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: 
            InputDecoration(
              hintText: "Email",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white, // Set border color
                  width:  3, // Set border width
                ),
              ),
              filled: true, // Fill the background with fillColor
              fillColor: Colors.white,
            ),
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
      ),
    );
  }
}
