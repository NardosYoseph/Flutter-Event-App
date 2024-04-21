import 'package:event_app/app/controllers/payment_controller/chapaPaymentController.dart';
import 'package:event_app/app/view/event/widgets/menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChapaPage extends StatelessWidget {
   ChapaPage({super.key});
   ChapaPaymentController chapacontroller= Get.find<ChapaPaymentController>();
   

  @override
  Widget build(BuildContext context) {
    final webview_cocntroller= WebViewController()
..setJavaScriptMode(JavaScriptMode.unrestricted)
..loadRequest(Uri.parse(chapacontroller.paymentUrl as String));
    return Scaffold(
         appBar: AppBar(actions: const [Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage( "assets/profile.png")
                
                ),
                SizedBox(width: 10,),
                Icon(Icons.notifications),
                SizedBox(width: 15,)],
                )
                ],),
      drawer: MySidebar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: WebViewWidget(controller: webview_cocntroller)),
    );
  }
}