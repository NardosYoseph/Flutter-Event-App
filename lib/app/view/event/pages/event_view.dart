import 'dart:io';
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
  PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(eventController.singleEvent.image) ),
        const SizedBox(
          height: 15,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "12+ people",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // SizedBox(
            //   width: 5,
            // ),
            SizedBox(
              width: 150,
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  CircleAvatar(
                    foregroundImage: NetworkImage(
                        "https://static.vecteezy.com/system/resources/previews/012/324/470/large_2x/half-body-20s-asian-woman-wear-formal-suit-blazer-shirt-dress-black-long-straight-hair-female-feel-happy-smile-fashion-vintage-poses-profile-look-at-camera-over-black-background-isolated-photo.jpg"),
                  ),
                  Positioned(
                    left: 60, // Adjust the position as needed
                    child: CircleAvatar(
                      foregroundImage: NetworkImage(
                          "https://static.vecteezy.com/system/resources/previews/012/324/470/large_2x/half-body-20s-asian-woman-wear-formal-suit-blazer-shirt-dress-black-long-straight-hair-female-feel-happy-smile-fashion-vintage-poses-profile-look-at-camera-over-black-background-isolated-photo.jpg"),
                    ),
                  ),
                  Positioned(
                    left: 40, // Adjust the position as needed
                    child: CircleAvatar(
                      foregroundImage: NetworkImage(
                          "https://static.vecteezy.com/system/resources/previews/012/324/470/large_2x/half-body-20s-asian-woman-wear-formal-suit-blazer-shirt-dress-black-long-straight-hair-female-feel-happy-smile-fashion-vintage-poses-profile-look-at-camera-over-black-background-isolated-photo.jpg"),
                    ),
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
         Text(eventController.singleEvent.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
         const Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Text(
                "Event detail decription Event detail decription\nEvent detail decription Event detail decription\nEvent detail decriptionEvent detail decription "),
          ],
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
                 Text(eventController.singleEvent.date.toString(), style: const TextStyle(fontSize: 18))
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
                 Text(eventController.singleEvent.price.toString(), style: const TextStyle(fontSize: 18))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Rate this event",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.black),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.star, color: Colors.black),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.star, color: Colors.black),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomizedButton(
                text: "Get ticket",
                onPressed: () async {
                  Payment payment = Payment(
                    amount: eventController.singleEvent.price.toString(),
                    currency: "ETB",
                    tx_ref: DateTime.now().millisecondsSinceEpoch.toString(),
                    callback_url: "$eventsApiUrl/verifyPayment",
                  );
                  String paymentUrl =
                      await paymentController.makePayment(payment);
                  launchUrl(Uri.parse(paymentUrl));

                }),
          ],
        )
      ],
    ));
  }
}
