import 'package:event_app/app/utils/text_util.dart';
import 'package:event_app/app/widgets/common/card.dart';
import 'package:event_app/app/widgets/common/search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:event_app/app/controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextUtil(
                  text: "Popular Events",
                  color: Colors.black,
                  size: 16,
                ),
                const SizedBox(
                  height: 15,
                ),
                 SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [          
                      GestureDetector(
                        onTap: () => Get.toNamed("/event_view"),
                        child: MyCard(
                          imagePath: "assets/event2.jpg",
                          description: "Amhara Bank\n 1st Year Aniversary",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MyCard(
                          imagePath: "assets/event3.jpg",
                          description: "Dinner program"),
                      SizedBox(
                        width: 10,
                      ),
                      MyCard(
                          imagePath: "assets/event4.jpg",
                          description: "Get together"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtil(
                      text: "All",
                      color: Colors.black,
                    ),
                    MySearch(),
                  ],
                ),
                const SizedBox(
                  height: 400,
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        MyCard(
                          imagePath: "assets/event4.jpg",
                          description: "Amhara Bank\n 1st Year Aniversary",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyCard(
                            imagePath: "assets/event5.jpg",
                            description: "Dinner program"),
                        SizedBox(
                          width: 10,
                        ),
                        MyCard(
                            imagePath: "assets/event6.jpg",
                            description: "Get together"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
