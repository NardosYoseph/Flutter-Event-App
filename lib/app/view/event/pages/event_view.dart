import 'dart:io';
import 'package:event_app/app/controllers/payment_controller/payment_controller.dart';
import 'package:event_app/app/controllers/user_conrollers/user_controller.dart';
import 'package:event_app/app/models/user/userModel.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:event_app/app/view/event/widgets/fetchUser.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:event_app/app/controllers/event_controllers/event_controller.dart';
import 'package:event_app/app/controllers/payment_controller/chapaPaymentController.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/models/payment/paymentModel.dart';
import 'package:event_app/app/routes/app_routes.dart';
import 'package:event_app/app/utils/constants.dart';
import 'package:event_app/app/view/event/pages/home_page.dart';
import 'package:event_app/app/view/event/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventView extends StatelessWidget {
  EventView({super.key});

  EventController eventController = Get.find<EventController>();
  ChapaPaymentController chapaPaymentController = Get.put(ChapaPaymentController());
  PaymentController paymentController = Get.put(PaymentController());
  String txnRef=DateTime.now().millisecondsSinceEpoch.toString();
  FetchUser fetchUser=FetchUser();
  UserController userController = Get.put(UserController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(actions:  [Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

                Icon(Icons.notifications),
                SizedBox(width: 15,)],
                )
                ],),
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
    height: 250,
          child: Image.network(eventController.singleEvent.image,fit:BoxFit.cover,height: 2500,width: double.infinity,) ),
    
        Expanded(
          child: Container(
            decoration: const BoxDecoration(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0), // Set desired radius
                topRight: Radius.circular(30.0), // Set desired radius
              ),
             ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
          SizedBox(
                height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                eventController.singleEvent.attendees!.length.toString()+" people",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // SizedBox(
              //   width: 5,
              // ),
              const SizedBox(
                width: 115,
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage( "assets/profile.png"),),
                    Positioned(
                      left: 60, // Adjust the position as needed
                      child: CircleAvatar(
                        backgroundImage: AssetImage( "assets/profile.png"), ),
                    ),
                    Positioned(
                      left: 40, // Adjust the position as needed
                      child: CircleAvatar(
                        backgroundImage: AssetImage( "assets/profile.png"), ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        
           Row(
             children: [
                const SizedBox(
width: 10,          ),
               Text(eventController.singleEvent.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
             ],
           ),
            Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(eventController.singleEvent.description) ],
          ),
          const SizedBox(
            height: 35,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 210, 233, 206),
                      ),
                      child: const Icon(
                        Icons.calendar_month_rounded,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                   Text(DateFormat('yyyy-MM-dd').format(eventController.singleEvent.date).toString(), style: const TextStyle(fontSize: 18))
               ,
               const SizedBox(
                    width: 10,
                  ),
                Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 210, 233, 206),
                      ),
                      child: const Icon(
                        Icons.punch_clock,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                   Text(eventController.singleEvent.time.toString(), style: const TextStyle(fontSize: 18)),
                   
               ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 210, 233, 206),
                      ),
                      child: const Icon(
                        Icons.attach_money,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                   Text(eventController.singleEvent.price.toString(), style: const TextStyle(fontSize: 18)),
                        const SizedBox(
                    width: 15,
                  ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 210, 233, 206),
                      ),
                       child:const Center(
                         child: Text("Left ticket",
                                         style: TextStyle(fontWeight: FontWeight.bold),
                                       ),
                       ),),
                         const SizedBox(
                    width: 10,
                  ),
                        Text(eventController.singleEvent.availableTickets.toString(),
                                         style: TextStyle(fontWeight: FontWeight.bold),
                                       ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
             
              const SizedBox(
                height: 20,
              ),
              CustomizedButton(
                  text: "Get ticket",
                  onPressed: () async {
final String? eventId=eventController.singleEvent.id;
final String? userId=userController.singleUser?.id;

                    Payment payment = Payment(
                      amount: eventController.singleEvent.price.toString(),
                      currency: "ETB",
                      tx_ref:txnRef,
                      callback_url: "$eventsApiUrl/payment/paymentStatus/$txnRef/$eventId/$userId",
                    );
                    payment.status="pending";
                    payment.eventId=eventController.singleEvent.id;
                    payment.userId=userController.singleUser?.id;
                    String paymentUrl =
                        await chapaPaymentController.makePayment(payment);
                    launchUrl(Uri.parse(paymentUrl));
            paymentController.storePayment(payment);
                  }),
            ]),
            ]),
          ),
        )
      ],
    ));
  }
}
