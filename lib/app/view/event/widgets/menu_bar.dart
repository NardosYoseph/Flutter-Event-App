import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for user image

class MySidebar extends StatelessWidget { // Path to your user image asset

  const MySidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer header with user information
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white, // Customize header color
            ),
            child: Column(
              children: [
                // User picture
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage( "https://static.vecteezy.com/system/resources/previews/012/324/470/large_2x/half-body-20s-asian-woman-wear-formal-suit-blazer-shirt-dress-black-long-straight-hair-female-feel-happy-smile-fashion-vintage-poses-profile-look-at-camera-over-black-background-isolated-photo.jpg")
                      
                ),
               // const SizedBox(height: 10),
                // Username
                Text(
                  "Nardos Yosef",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                // Email address
                Text(
                  "nardosyosef123@gmail.com",
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
            leading: const Icon(Icons.confirmation_number),
            title: const Text('Event Tickets'),
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
