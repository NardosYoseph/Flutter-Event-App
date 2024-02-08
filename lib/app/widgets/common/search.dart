import 'package:event_app/app/widgets/common/text_field.dart';
import 'package:flutter/material.dart';

class MySearch extends StatelessWidget {
   MySearch({super.key});
  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 150,
      child: MyTextField(label: "search", controller: searchController,suffixIcon: Icon(Icons.search),),
    );
  }
}