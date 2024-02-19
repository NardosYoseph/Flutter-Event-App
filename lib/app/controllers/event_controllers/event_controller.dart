import 'dart:convert';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/services/eventService/event_service.dart';
import 'package:event_app/app/view/event/pages/create_event_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart'as dio;


class EventController extends GetxController{
final EventService _eventService= EventService();
  Future<void> CreateEvent(BuildContext context,Event event) async {
   try {
      // Call the registerUser method from AuthService
      final success = await _eventService.createEvent(event);
      ScaffoldMessenger.of(context ).showSnackBar(SnackBar(content: Text('Event created successfully')));
      if (success) {
      Get.toNamed("/homepage");
      } else { 
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error ctreating Event')));
        print('internal Error registering event');
      }
    } catch (error) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error ctreating Event')));

      print('controller Error adding event: $error');
    }
  }
   Future<List<Event>> fetchEvent() async {
  
   try {
      // Call the registerUser method from AuthService
      final response = await _eventService.fetchEvent();
     return response;
    } catch (error) {
      // Handle any exceptions
      print('Error fetching event: $error');
      return [];
    }
  }
}