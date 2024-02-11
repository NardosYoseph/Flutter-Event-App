import 'dart:convert';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class EventService{
      List<Event> events = [];
  Future<bool> createEvent(Event event) async {
    // Make a POST request to the registration endpoint
    print("data"+event.description);
    final response = await http.post(
      Uri.parse('$eventsApiUrl/event/create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'description': event.description,
      'date': event.date.toIso8601String(),
      'time': event.time.toString(),
      'image': event.image,
      'rate': event.rate,
      'people': event.people}),
    );
print(response.body);
    // Check if the request was successful and handle the response
    if (response.statusCode == 200) {
     return true;}
     else{
      print("not 200 code");
      return false; // Failed registration
    }
    
  }

  Future<List<Event>> fetchEvent() async {
    final response = await http.get(
      Uri.parse('$eventsApiUrl/event/allEvents'),
      headers: {'Content-Type': 'application/json'},
    );
print(response.body);
    // Check if the request was successful and handle the response
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
    
    // Extract the list of events from the response data
    final List<dynamic> eventList = responseData['eventList'];
    
    List<Event> events = eventList.map((e) => Event.fromJson(e)).toList();
     return events;}
     else{
      return []; // Failed registration
    }
    
  }
}