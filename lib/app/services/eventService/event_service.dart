import 'dart:convert';
import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/models/event/eventModel.dart';
//import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import 'package:dio/dio.dart' ;


class EventService{
  Future<bool> createEvent(Event event) async {
      print(event.image);
    final formData = await event.toFormData();
    final response = await ApiHandler().MultipartRequest("/event/create", formData,headers: {'Content-Type': 'multipart/form-data'});
    return response;
  }

  Future<List<Event>> fetchEvent() async {
    final response = await ApiHandler().get("/event/allEvents");
    print(response);
    if (response.containsKey('eventList')) {
    List<Event> events = (response['eventList'] as List<dynamic>)
        .map((json) => Event.fromJson(json))
        .toList();
        
    return events;
  } else {
    throw Exception('Failed to fetch events');
  }
    return response;
  }
}


