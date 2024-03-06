import 'dart:convert';
import 'dart:io';
import 'dart:math';
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
  Event? singleEvent=null;

  Future<void> CreateEvent(BuildContext context,Event event,File? image) async {
   try {
 final userCredential = await signInAnonymously();
  final user = userCredential?.user;

  if (user == null) {
    return null; 
  }
      final imageUrl = await _uploadImageToFirebaseStorage(image!,user.uid);

       final updatedEvent = Event(
        title: event.title,
        description: event.description,
        date: event.date,
        time: event.time,
        image: imageUrl, 
        rate: event.rate,
        price: event.price,
        totalTickets: event.totalTickets,
        paidTickets: event.paidTickets
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

 Future<Event?> fetchEventbyID(String? eventID) async {
   try {
      final response = await _eventService.fetchEventbyID(eventID);
      singleEvent=response;
      print(singleEvent);
     return response;
    } catch (error) {
      print('Error fetching event: $error');
      return null;
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
}}