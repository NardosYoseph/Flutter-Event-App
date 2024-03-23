
import 'package:event_app/app/controllers/user_conrollers/user_controller.dart';
import 'package:event_app/app/models/user/userModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart'; 
import 'package:jwt_decoder/jwt_decoder.dart';

class MySidebar extends StatelessWidget {
   MySidebar({
    super.key,
  });

  UserController userController = Get.put(UserController());

//  @override
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage( "assets/profile.png"),
                ),
               GetBuilder<UserController>(
  init: UserController(), // Initialize the controller
  builder: (controller) => Text(
    controller.singleUser?.username ?? "", // Use safe navigation
    style: const TextStyle(fontSize: 18, color: Colors.black),
  ),
),
                GetBuilder<UserController>(
  init: UserController(), // Initialize the controller
  builder: (controller) => Text(
    controller.singleUser?.email ?? "", // Use safe navigation
    style: const TextStyle(fontSize: 18, color: Colors.black),
  ),
),
              ],
            ),
          ),
            ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          onTap: () => Get.toNamed("/homepage"), // Replace with your action
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('My Events'),
          onTap: () => Get.toNamed("/myEvents"), // Replace with your action
          ),
         
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.pop(context), // Replace with your action
          ),
            ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => Get.toNamed("/login"), // Replace with your action
          ),
        ],
      ),
    );
  }
}
