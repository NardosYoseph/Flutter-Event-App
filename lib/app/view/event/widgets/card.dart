import 'dart:io';

import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:event_app/app/controllers/event_controllers/event_controller.dart";
class MyCard extends StatelessWidget {
final Event? event;
   MyCard({super.key,required this.event});
EventController eventController= Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        eventController.fetchEventbyID(event!.id);
Get.toNamed('/event_view');
      },
      
      child: Container(
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
           child: Image.network(event!.image,fit: BoxFit.fitHeight,width: 200,height: 200,)),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtil(text: event!.description),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Icon(Icons.star,color: Color.fromARGB(255, 245, 189, 3),),
          Icon(Icons.star,color: Color.fromARGB(255, 245, 189, 3),),
          Icon(Icons.star,color: Color.fromARGB(255, 245, 189, 3),),
          Icon(Icons.star,color: Color.fromARGB(255, 245, 189, 3),),
          Icon(Icons.star,color: Color.fromARGB(255, 245, 189, 3),),
        ],)
         ],
        ),
        ]),
        ),
      ),
    );
  }
}