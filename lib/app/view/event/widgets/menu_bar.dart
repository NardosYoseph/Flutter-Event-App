
import 'package:event_app/app/controllers/user_conrollers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart'; // for user image

class MySidebar extends StatelessWidget { // Path to your user image asset
  UserController userController = Get.find<UserController>();

   MySidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage( "assets/profile.png"),
                ),
                Text(
                  userController.singleUSer.username,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  userController.singleUSer.email,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('My Events'),
            onTap: () => Navigator.pop(context), // Replace with your action
          ),
         
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.pop(context), // Replace with your action
          ),
        ],
      ),
    );
  }
}
