import 'package:event_app/app/utils/text_util.dart';
import 'package:event_app/app/widgets/common/card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:event_app/app/controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Padding(
          
          padding: const EdgeInsets.all(15),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
         
          TextUtil(
            text: "Popular Events",
            color: Colors.black,
            size: 16,
          ),
          const SizedBox(
            height: 15,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
          //         const SizedBox(
          //   width: 15,
          // ),
                MyCard(),
                SizedBox(
                  width: 10,
                ),
                MyCard(),
                SizedBox(
                  width: 10,
                ),
                MyCard(),
              ],
            ),
          )
                ],
              ),
        ));
  }
}
