import 'dart:convert';
import 'dart:js';
import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class EventService{
      List<Event> events = [];
  Future<bool> createEvent(Event event) async {
    final response = await ApiHandler().MultipartRequest("/event/create", event);
    return response;
  }

  Future<List<Event>> fetchEvent() async {
    final response = await ApiHandler().get("/event/allEvents");
    return response;
  }
}


