import 'package:event_app/app/models/payment/paymentModel.dart';
import 'package:event_app/app/services/paymentService/chapaPaymentServcie.dart';
import 'package:get/get.dart';


class PaymentController extends GetxController{
final ChapaPaymentService _paymentService= ChapaPaymentService();

Future<dynamic> makePayment(Payment payment) async {
   try {
      final response = await _paymentService.makePayment(payment);
      response;
      print(response);
     return response;
    } catch (error) {
      print('Error making payment: $error');
      return null;
    }
  }
}