import 'dart:io';

import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:event_app/app/controllers/event_controllers/event_controller.dart";
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';
class MyEventCard extends StatelessWidget {
final Event? event;
   MyEventCard({super.key,required this.event});
EventController eventController= Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 245, 245, 245),
      height: 200,
      width: double.infinity,
      child: Row(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), 
              ),
          
            child: Container(
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), 
                            //color: Colors.transparent,
                            gradient: LinearGradient(colors: [Colors.black.withOpacity(0.5),Colors.black.withOpacity(0.0)],begin:Alignment.bottomCenter,end: Alignment.center)),
                  height: 200,
                  width: 200,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
           ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    
                      child: Image.network(event!.image,fit: BoxFit.cover,width: 200,height: 200,)),
                  Container(
                     
                          decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                            //color: Colors.transparent,
                            gradient: LinearGradient(colors: [const Color.fromARGB(255, 2, 116, 6).withOpacity(0.7),Colors.black.withOpacity(0.0)],begin:Alignment.bottomCenter,end: Alignment.centerRight)),
                  height: 200,
                  width: 200),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              TextUtil(text: event!.title,size: 20),
          
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [  Icon(
                       color:Color.fromARGB(255, 207, 170, 2),
                                         Icons.attach_money_outlined,
                                         size: 25,
                                       ),
                         TextUtil(text: event!.price.toString(),size: 20,),
                           TextUtil(text:"birr",size: 20),
                       ],
                     ),
                                       
                     SizedBox(height: 5,),
                        Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                     Icon(
                       color:Color.fromARGB(255, 207, 170, 2),
                                         Icons.calendar_month_rounded,
                                         size: 25,
                                       ),
                     SizedBox(height: 5,),
                                   
                     TextUtil(text: DateFormat('yyyy-MM-dd').format(event!.date),size: 20),]),
          
                     ],
                    ),
                  ),
                
                   ] ),
            ),
          ),
SizedBox(
  height: 200,

  child: Center(
    child: QrImageView(  data: "Event name: ${event?.title} Transaction ID: ${event?.paymentID}",
                    version: QrVersions.auto,
                    size: 150,
      ),
  ),
)

        ],
      ),
    );
  }
}