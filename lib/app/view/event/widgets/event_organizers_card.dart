import 'dart:io';

import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:event_app/app/controllers/event_controllers/event_controller.dart";
class EventOrganizersCard extends StatelessWidget {
String imageurl;
   EventOrganizersCard({super.key,required this.imageurl});
EventController eventController= Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      child: Card(
        //elevation: 10,
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),
    
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children:[ 
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
         child: Image.asset(imageurl,fit: BoxFit.cover,width: 350,height: 250,)),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtil(text: "Gift Event ORganizers"),
       Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 100,height: 30,
          child: FloatingActionButton(child: Text("Follow"),onPressed:(){},),)
      ],)
       ],
      ),
      ]),
      ),
    );
  }
}