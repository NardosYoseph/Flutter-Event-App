import 'package:event_app/app/controllers/event_controllers/event_controller.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:event_app/app/view/event/widgets/card.dart';
import 'package:event_app/app/view/event/widgets/fields/search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:event_app/app/controllers/user_conrollers/auth/auth_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController SearchController =TextEditingController();
  List<Event> events = [];

  final AuthController controller = Get.find();
  final EventController eventController = Get.put(EventController());
   @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
  final fetchedEvents = await eventController.fetchEvent();
  setState(() {
    events = fetchedEvents;
  });
}


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
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     SearchTextField(controller: SearchController),
                    IconButton(onPressed: (){Get.toNamed("/createEvent");}, icon: Icon(Icons.add,size: 35,color: Colors.black,)),
                   ],
                 ),
                TextUtil(
                  text: "Recent Events",
                  color: Colors.black,
                  size: 16,
                ),
                const SizedBox(
                  height: 15,
                ),
               SizedBox(
                height: 200,
                 child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        return MyCard(description: events[index].description,image: events[index].image,);
                      }
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
                  ],
                ),
                SizedBox(
                  width: 200,
                  height: 350,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return MyCard(description: events[index].description,image: events[index].image,);
                    }
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
