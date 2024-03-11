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
    return Card(
      child: Container(
        color: Color(0XFF509E3D),
        height: 250,
        width: double.infinity,
        child: Column(
          children:[ SizedBox(
            width: double.infinity,
            child: Image.network(event!.image,fit: BoxFit.fill,width: double.infinity,height: 200,)),
              Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          TextUtil(text: event!.title),
               Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Icon(Icons.attach_money_sharp,color: Color.fromARGB(255, 245, 189, 3),),

                      TextUtil(text: event!.price.toString()),
                    Icon(Icons.star,color: Color.fromARGB(255, 245, 189, 3),),
                    Icon(Icons.star,color: Color.fromARGB(255, 245, 189, 3),),
                    Icon(Icons.star,color: Color.fromARGB(255, 245, 189, 3),),
                    Icon(Icons.star,color: Color.fromARGB(255, 245, 189, 3),),
                    Icon(Icons.star,color: Color.fromARGB(255, 245, 189, 3),),
              ],)
               ],
              ),]
        ),
      ),
    );
  }
}