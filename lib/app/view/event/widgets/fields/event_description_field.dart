import 'package:flutter/material.dart';

class EventDescriptionField extends StatelessWidget {
   EventDescriptionField
({super.key,required this.controller,required this.description});
final TextEditingController controller;
  late String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      child: TextFormField(
        controller: controller,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) => description = value!,
              ),
    );
  }
}