import 'package:flutter/material.dart';

class EventTitleField extends StatelessWidget {
   EventTitleField({super.key,required this.controller,required this.title});
final TextEditingController controller;
  late String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 250,
      child: TextFormField(
        controller: controller,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) => title = value!,
              ),
    );
  }
}