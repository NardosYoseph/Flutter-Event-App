import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/models/payment/paymentModel.dart';

class PaymentService{
  Future<Payment> storePayment(Payment payment) async{
final  response= await ApiHandler().post('/payment/storePayment', payment);
if(response){
return response;}
else{
  throw Exception('failed to store payment');
}
  }
}