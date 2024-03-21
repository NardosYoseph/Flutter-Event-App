import 'dart:ffi';

class Payment {
  String? id;
  final String amount;
  final String currency;
  final String tx_ref;
 String? status;
   String? callback_url;
   List<dynamic>? userId;
   List<dynamic>? eventId;


  Payment({
    this.id,
   required this.amount,
    required this.currency,
    required this.tx_ref,
    this.callback_url,
    this.status,
   //  this.return_url,
     this.userId,
     this.eventId

  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['_id'],
      amount: json['amount'],
      currency: json['currency'],
      tx_ref:json['tx_ref'],
      status:json['status'],
      callback_url: json['callback_url'],
      //return_url:json["return_url"],
      userId: json['userId'],
      eventId: json['eventId'],
      
    );
  }
  
  Map<String, dynamic> toJson() => {
'id':id,
'amount':amount,
'currency':currency,
'tx_ref':tx_ref,
'status':status,
'callback_url':callback_url,
//'return_url':return_url,
'userId':userId,
'eventId':eventId
};
}