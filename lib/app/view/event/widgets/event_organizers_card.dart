import 'dart:io';

import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:event_app/app/controllers/event_controllers/event_controller.dart";
class EventOrganizersCard extends StatelessWidget {

   EventOrganizersCard({super.key});
EventController eventController= Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
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
         child: Image.asset("assets/event organizer3.jpg",fit: BoxFit.fitHeight,width: 200,height: 200,)),
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