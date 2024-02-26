import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class Event {
  final String description;
  final DateTime date;
  final String time;
  final double rate;
  final int people;
  final String image;

  Event({
    required this.description,
    required this.date,
    required this.time,
    required this.rate,
    required this.people,
    required this.image,

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

   Future<FormData> toFormData() async {
    FormData formData = FormData();

    formData.fields.add(MapEntry('description', description));
    formData.fields.add(MapEntry('date', date.toIso8601String()));
    formData.fields.add(MapEntry('time', time));
    formData.fields.add(MapEntry('rate', rate.toString()));
    formData.fields.add(MapEntry('people', people.toString()));
  
  // File imageFile = image;
  formData.files.add(MapEntry(
    'image',
    await MultipartFile.fromFile(
      image,
      filename: image.split('/').last,
      contentType: MediaType('image',  'jpeg'), // Adjust according to your file type
    ),
  ));
    return formData;
  }

Map<String, dynamic> toJson() => {
    'description': description,
    'date': date.toIso8601String(), 
    'time': time,
    'image': image,
    'rate': rate,
    'people': people,
  };
}