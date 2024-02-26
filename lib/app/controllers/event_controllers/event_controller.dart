import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/services/eventService/event_service.dart';
import 'package:event_app/app/view/event/widgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'as dio;
import 'package:firebase_auth/firebase_auth.dart';

class EventController extends GetxController{
final EventService _eventService= EventService();
final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> CreateEvent(BuildContext context,Event event,File? image) async {
   try {
 final userCredential = await signInAnonymously();
  final user = userCredential?.user;

  if (user == null) {
    return null; 
  }
      final imageUrl = await _uploadImageToFirebaseStorage(image!,user.uid);

       final updatedEvent = Event(
        // Copy the properties from the original event
        // and update the image property with the imageUrl
        description: event.description,
        date: event.date,
        time: event.time,
        image: imageUrl, // Updated image URL
        rate: event.rate,
        people: event.people,
      );
      final success = await _eventService.createEvent(updatedEvent);
      if (success!=null) {
        CustomSnackBar(message: "Event created successfully");
      Get.toNamed("/homepage");
      } else { 
        CustomSnackBar(message: 'Error ctreating Event',);
        print('internal Error registering event');
      }
    } catch (error) {
      CustomSnackBar(message: 'Error ctreating Event');

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
Future<String> _uploadImageToFirebaseStorage(File image,String token) async {
    try {
    final filename = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final ref = FirebaseStorage.instance.ref().child('event_images/$filename');
    final metadata = SettableMetadata(
      customMetadata: {'token': token},
    );
    final uploadTask = ref.putFile(image,metadata);
    final snapshot = await uploadTask.whenComplete(() {});
    return await snapshot.ref.getDownloadURL();
  } catch (error) {
      print('Error uploading image to Firebase Storage: $error');
      rethrow; 
    }
  }
  Future<UserCredential?> signInAnonymously() async {
  try {
    final credential = await FirebaseAuth.instance.signInAnonymously();
    if(credential.user != null) print('Signed in anonymously as: $credential');
    return credential;
  } catch (e) {
    print('Error signing in anonymously: $e');
    return null;
  }
}