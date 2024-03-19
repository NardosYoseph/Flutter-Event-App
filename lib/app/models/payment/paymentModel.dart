import 'dart:ffi';

class Payment {
  String? id;
  final String amount;
  final String currency;
  final String tx_ref;
   String? callback_url;
   //String? return_url;
   List<dynamic>? userId;

  Payment({
    this.id,
   required this.amount,
    required this.currency,
    required this.tx_ref,
    this.callback_url,
   //  this.return_url,
     this.userId

  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['_id'],
      amount: json['amount'],
      currency: json['currency'],
      tx_ref:json['tx_ref'],
      callback_url: json['callback_url'],
      //return_url:json["return_url"],
      userId: json['userId'],
      
    );
  }
  
  Map<String, dynamic> toJson() => {
'id':id,
'amount':amount,
'currency':currency,
'tx_ref':tx_ref,
'callback_url':callback_url,
//'return_url':return_url,
'userId':userId,
};
}