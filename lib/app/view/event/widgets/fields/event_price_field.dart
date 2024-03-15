import 'package:flutter/material.dart';

class EventPriceField extends StatelessWidget {
   EventPriceField
({super.key,required this.controller,required this.price});
final TextEditingController controller;
  late String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 250,
      child: TextFormField(
        controller: controller,
                decoration: InputDecoration(labelText: 'Ticket price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Ticket price';
                  }
                  return null;
                },
                onSaved: (value) => price = value!,
              ),
    );
  }
}