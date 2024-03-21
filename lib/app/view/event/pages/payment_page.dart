import 'package:event_app/app/controllers/payment_controller/chapaPaymentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  final _controller = WebViewController();
  
  ChapaPaymentController paymentController= Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My WebView'),
      ),
      body: WebViewWidget(
        
        controller: _controller,
       // initialUrl: paymentController.paymentUrl,
      ),
    );
  }
}
