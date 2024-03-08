import 'package:event_app/app/models/payment/paymentModel.dart';
import 'package:event_app/app/services/paymentService/chapaPaymentServcie.dart';
import 'package:get/get.dart';


class PaymentController extends GetxController{
final ChapaPaymentService _paymentService= ChapaPaymentService();
String? paymentUrl;
Future<dynamic> makePayment(Payment payment) async {
   try {
       paymentUrl = await _paymentService.makePayment(payment);
      print(paymentUrl);
     return paymentUrl;
    } catch (error) {
      print('Error making payment: $error');
      return null;
    }
  }
}