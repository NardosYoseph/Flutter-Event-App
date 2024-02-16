import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class Event {
  final String description;
  final DateTime date;
  final String time;
  final File image;
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


  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      description: json['description'],
      date: DateTime.parse(json['date']),
      time: json['time'],
      image: json['image'],
      rate: json['rate'].toDouble(),
      people: json['people'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'date': date.toIso8601String(),
      'time': time,
      'image': image, // Assuming image is already a path or URL
      'rate': rate,
      'people': people,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}
