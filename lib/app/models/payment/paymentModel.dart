import 'dart:ffi';

class Payment {
  final String amount;
  final String currency;
  final String tx_ref;
   String? callback_url;
   String? return_url;
   String? userId;


  Payment({
   required this.amount,
    required this.currency,
    required this.tx_ref,
    this.callback_url,
     this.return_url,
     this.userId

  });
  
  Map<String, dynamic> toJson() => {

'amount':amount,
'currency':currency,
'tx_ref':tx_ref,
'callback_url':callback_url,
'return_url':return_url,
'userId':userId,
};
}