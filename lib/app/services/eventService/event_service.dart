import 'dart:convert';
import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import 'package:dio/dio.dart' as dio;


class EventService{
  Future<bool> createEvent(Event event) async {
    final formData = event.toFormData();
    final response = await ApiHandler().MultipartRequest("/event/create", formData,headers: {'Content-Type': 'multipart/form-data'});
    return response;
  }

  Future<List<Event>> fetchEvent() async {
    final response = await ApiHandler().get("/event/allEvents");
    return response;
  }
}


