import 'dart:convert';

import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/services/eventService/event_service.dart';
import 'package:event_app/app/view/event/pages/create_event_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class EventController extends GetxController{
final EventService _eventService= EventService();
  Future<void> CreateEvent(Event event) async {
   try {
      // Call the registerUser method from AuthService
      final success = await _eventService.createEvent(event);
      if (success) {
      Get.toNamed("/homepage");
      } else { print('internal Error registering event');
      }
    } catch (error) {
      // Handle any exceptions
      print('Error fetching user: $error');
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