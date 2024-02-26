import 'package:event_app/app/models/event/eventModel.dart';
import 'package:flutter/material.dart';

class EventView extends StatelessWidget {
   EventView({super.key});

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
            child: Image.network( "https://firebasestorage.googleapis.com/v0/b/event-app-67384.appspot.com/o/event_images%2F1708773237190.jpg?alt=media&token=09286eed-b14b-4bf2-a159-79528a5ad740",fit: BoxFit.cover,),
          ),
          SizedBox(height: 15,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("+12 people"),
              SizedBox(width: 15,),
              SizedBox(
                width: 150,
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                  CircleAvatar(foregroundImage: NetworkImage( "https://firebasestorage.googleapis.com/v0/b/event-app-67384.appspot.com/o/event_images%2F1708773237190.jpg?alt=media&token=09286eed-b14b-4bf2-a159-79528a5ad740"),)
                //  ,Positioned(
                //           left: 20, // Adjust the position as needed
                //           child:  CircleAvatar(foregroundImage: NetworkImage( "https://firebasestorage.googleapis.com/v0/b/event-app-67384.appspot.com/o/event_images%2F1708773237190.jpg?alt=media&token=09286eed-b14b-4bf2-a159-79528a5ad740"),),
                 
                //         )
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
