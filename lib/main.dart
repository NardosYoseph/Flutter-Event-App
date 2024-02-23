import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/routes/app_routes.dart';
import 'package:event_app/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' ;
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';
void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
//FirebaseAppCheck.instance.checkDevice();
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.INITIAL,
      getPages: AppRoutes.routes,
    );
  }
}