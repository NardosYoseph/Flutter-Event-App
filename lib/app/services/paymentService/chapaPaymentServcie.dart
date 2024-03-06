
import 'package:event_app/app/apiHandler/api_handler.dart';
import 'package:event_app/app/models/payment/paymentModel.dart';

class ChapaPaymentService{
  Future<dynamic> makePayment(Payment payment) async {
    ApiHandler().setAuthorization("CHASECK_TEST-UypQuM3qv8ILnTdCRpdqjrzmnQxIksKx");
    final response = await ApiHandler().pay("https://api.chapa.co/v1/transaction/initialize", payment.toJson());
     if (response['status']=='success') {
      return response['data']['checkout_url'];
    }
    return null;
  }}