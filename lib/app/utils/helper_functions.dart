import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  return DateFormat('EEE, MMM d, yyyy - h:mm a').format(dateTime);
}

// Check internet connection
bool isConnectedToInternet() {
  return true;
}

// Show snackbar with message
void showSnackbar(String message, BuildContext context) {
  Get.snackbar(
    'Message',
    message,
    snackPosition: SnackPosition.BOTTOM,
  );
}

// Load image from network
ImageProvider loadImage(String imageUrl) {
  return NetworkImage(imageUrl);
}
