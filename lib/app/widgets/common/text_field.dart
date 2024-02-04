import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? initialValue;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? errorText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const MyTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.initialValue,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.errorText,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]?? Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        errorText: errorText,
      ),
     
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
    );
  }
}
