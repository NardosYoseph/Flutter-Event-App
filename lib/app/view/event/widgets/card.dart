import 'dart:io';

import 'package:event_app/app/utils/text_util.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
final File? image;
final String? description;



  const MyCard({super.key,required this.image,required,this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Card(
        //elevation: 10,
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Adjust the value as needed
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children:[ 
          ClipRRect(
            
            borderRadius: BorderRadius.circular(10),
            child: Image.file(  File(image! as String),fit: BoxFit.cover,height: 200,width: 200,),
          ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtil(text: description!),
       
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
    );
  }
}