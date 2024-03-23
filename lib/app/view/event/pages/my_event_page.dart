import 'package:event_app/app/controllers/user_conrollers/user_controller.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:event_app/app/view/event/widgets/card.dart';
import 'package:event_app/app/view/event/widgets/fetchUser.dart';
import 'package:event_app/app/view/event/widgets/menu_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyEventPge extends StatefulWidget {
  const MyEventPge({super.key});

  @override
  State<MyEventPge> createState() => _MyEventPgeState();
}

class _MyEventPgeState extends State<MyEventPge> {
  List<Event>? events = [];
  UserController userController = Get.put(UserController());
  FetchUser fetchUser=FetchUser();

 @override
  void initState() {
    super.initState();
    _fetchUserEvents();
  }
  Future<void> _fetchUserEvents() async {

final String? userId=userController.singleUser?.id;

  print(userId);
  final fetchedEvents = await userController.findUserEvents(userId);
  print(fetchedEvents);
  setState(() {
    events = fetchedEvents;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: const [Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage( "assets/profile.png")
                
                ),
                SizedBox(width: 10,),
                Icon(Icons.notifications),
                SizedBox(width: 15,)],
                )
                ],),
         drawer: MySidebar(),
         
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     TextUtil(
                  text: " Your Events",
                  color: Colors.black,
                  size: 16,
                ),
                   ],
                 ),
               
                const SizedBox(
                  height: 15,
                ),
               SizedBox(
                height: 700,
                 child: ListView.builder(
                      scrollDirection: Axis.vertical,
                   itemCount: events?.length,
                      itemBuilder: (context, index) {
                        return MyCard(event: events?[index],);

                      }
                    ),
               ),
            ])
            )));
  }
}