import 'package:event_app/app/utils/text_util.dart';
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
appBar: AppBar(title: TextUtil(text: "hello${controller.Username}",color: Colors.black,),),
body: Container(child: Text("home"),),
    );
  }
}