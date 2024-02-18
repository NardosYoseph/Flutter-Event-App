import 'dart:convert';
import 'dart:io';// Import Dio and MultipartFile
import 'package:dio/dio.dart';
import 'package:path/path.dart'; // Import basename

import 'package:dio/dio.dart' as dio;
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

   dio.FormData toFormData() {
    dio.FormData formData = dio.FormData();

    formData.fields.add(MapEntry('description', description));
    formData.fields.add(MapEntry('date', date.toIso8601String()));
    formData.fields.add(MapEntry('time', time));
    formData.fields.add(MapEntry('rate', rate.toString()));
    formData.fields.add(MapEntry('people', people.toString()));

    // Add the image file
    formData.files.add(MapEntry(
      'image',
      dio.MultipartFile.fromFileSync(image.path, filename: basename(image.path)),
    ));

    return formData;
  }
}
