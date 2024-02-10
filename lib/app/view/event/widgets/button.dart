import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? primaryColor;
  final Color? textColor;
  final double? elevation;
  final double? borderRadius;
  final double? fontSize;

  const CustomizedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.primaryColor,
    this.textColor,
    this.elevation,
    this.borderRadius,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
  width: 350,
   child: ElevatedButton(

      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        
        backgroundColor: Color(0XFF509E3D),
        primary: primaryColor ?? Theme.of(context).primaryColor,
        onPrimary: textColor ?? Colors.white,
        elevation: elevation ?? 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 35),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: TextStyle(fontSize: fontSize ?? 18),
      ),
      child: Text(text),
      ));
  }
}
