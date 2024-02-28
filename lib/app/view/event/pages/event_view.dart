import 'package:event_app/app/controllers/event_controllers/event_controller.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventView extends StatelessWidget {
   EventView({super.key});

   EventController eventController= Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(eventController.singleEvent!.image)
            ),
          SizedBox(height: 15,),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(eventController.singleEvent!.people as String,style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 15,),
              const SizedBox(
                width: 150,
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                  CircleAvatar(foregroundImage: NetworkImage( "https://firebasestorage.googleapis.com/v0/b/event-app-67384.appspot.com/o/event_images%2F1708773237190.jpg?alt=media&token=09286eed-b14b-4bf2-a159-79528a5ad740"),)
                ,
                        Positioned(
                          left: 35, // Adjust the position as needed
                          child:  CircleAvatar(foregroundImage: NetworkImage(  "https://firebasestorage.googleapis.com/v0/b/event-app-67384.appspot.com/o/event_images%2F1708781405934.jpg?alt=media&token=e7e19022-746c-4378-9442-9139658047ec"),),
       
                        ),
                         Positioned(
                          left: 50, // Adjust the position as needed
                          child:  CircleAvatar(foregroundImage: NetworkImage( "https://firebasestorage.googleapis.com/v0/b/event-app-67384.appspot.com/o/event_images%2F1708773237190.jpg?alt=media&token=09286eed-b14b-4bf2-a159-79528a5ad740"),),
                 
                        ),
                         Positioned(
                          left: 65, // Adjust the position as needed
                          child:  CircleAvatar(foregroundImage: NetworkImage( "https://firebasestorage.googleapis.com/v0/b/event-app-67384.appspot.com/o/event_images%2F1708773237190.jpg?alt=media&token=09286eed-b14b-4bf2-a159-79528a5ad740"),),
                        ),
                 
                  ],),
              ),
                SizedBox(width: 20,)
          
            ],
          ),
SizedBox(height: 15,),


          Row(
            children: [
SizedBox(width: 10,),

              Text("cncnnddjjsb ,C bcjsjjsjsjsnnsnmsjjskaka\nkskskskskkssjssmsmmsmsmsmsmakaka\njjjjjjjjjjjuiiiiiuuuugyftftcfcfcf"),
            ],
          ),

        ],
      ));
  }
}
