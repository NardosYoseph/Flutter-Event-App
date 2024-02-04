import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:get/get.dart';
class AnimatedSplashScreen extends StatefulWidget {
  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
@override
  void initState() {
    super.initState();

    // Set the duration you want the splash screen to be displayed (in seconds)
    const splashDuration = 6;

    // Use Timer to wait for the specified duration and then navigate to the main screen
    Timer(
      Duration(seconds: splashDuration),
      () {
        Get.toNamed("/login");
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color as needed
      body: Center(
        child: FlareActor(
          "assets/Syncing Spinner.flr", // Replace with your animation file path
          animation: "Untitled", // Replace with your animation name
          fit: BoxFit.cover,
          callback: (String animationName) {
            // Navigate to the next screen after the animation completes
           Get.toNamed("/login");
          },
        ),
      ),
    );
  }
}
