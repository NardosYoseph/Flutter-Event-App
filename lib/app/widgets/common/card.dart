import 'package:event_app/app/utils/text_util.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,

      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children:[ 
        SizedBox(
        height: 200,
        width: 200,
        child: Image.asset("assets/event1.jpg",fit: BoxFit.cover,),

    ),
    TextUtil(text: "AMharaBank First Year aniver"),
    Row(children: [
      Icon(Icons.star,color: Color.fromARGB(255, 245, 221, 3),)
    ],)
    ]),
    );
  }
}