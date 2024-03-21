import 'package:event_app/app/models/payment/paymentModel.dart';
import 'package:event_app/app/services/paymentService/payment_service.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{
  final PaymentService _paymentService=PaymentService();
  Future<Payment?> storePayment(Payment payment) async{
try{
final response=await _paymentService.storePayment(payment);
return response;
}
catch(error){
return null;
}
  }
}