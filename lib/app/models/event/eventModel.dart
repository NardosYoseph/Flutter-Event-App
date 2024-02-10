import 'package:flutter/material.dart';

class Event {
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final String image;
  final double rate;
  final int people;

  Event({
    required this.description,
    required this.date,
    required this.time,
    required this.image,
    required this.rate,
    required this.people,
  });
}
