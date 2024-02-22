import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
   CustomSnackBar ({super.key,required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(message)),
    );
    return SizedBox.shrink();
  }
}