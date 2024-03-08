import 'package:event_app/app/controllers/event_controllers/event_controller.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:event_app/app/view/event/widgets/card.dart';
import 'package:event_app/app/view/event/widgets/event_organizers_card.dart';
import 'package:event_app/app/view/event/widgets/fields/search_bar.dart';
import 'package:event_app/app/view/event/widgets/menu_bar.dart';
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

  final AuthController controller = Get.put(AuthController());
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
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                    IconButton(onPressed: (){Get.toNamed("/createEvent");}, icon: Icon(Icons.add,size: 35,color: Colors.black,)),
                   ],
                 ),
                TextUtil(
                  text: "Event Organizers",
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
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return EventOrganizersCard();

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
                      text: "AllEvents",
                      color: Colors.black,
                    ),
                     SearchTextField(controller: SearchController),
                  ],
                ),
                SizedBox(height: 5,),
                SizedBox(
                  width: 200,
                  height: 350,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: ()  async { 
                          
                     Event? event=  await eventController.fetchEventbyID(events[index].id);
                       print(event!.title);
 
                             Get.toNamed('/event_view');
   
                        },
                        child: MyCard(event: events[index]));
                    }
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
