import 'package:event_app/app/controllers/event_controllers/event_controller.dart';
import 'package:event_app/app/controllers/user_conrollers/user_controller.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/utils/text_util.dart';
import 'package:event_app/app/view/event/widgets/card.dart';
import 'package:event_app/app/view/event/widgets/event_organizers_card.dart';
import 'package:event_app/app/view/event/widgets/fields/search_bar.dart';
import 'package:event_app/app/view/event/widgets/menu_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:event_app/app/controllers/user_conrollers/auth/auth_controller.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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
  UserController userController = Get.put(UserController());

   @override
  void initState() {
    super.initState();
    _fetchEvents();
     _fetchUser();
  }

  Future<void> _fetchEvents() async {
  final fetchedEvents = await eventController.fetchEvent();
  setState(() {
    events = fetchedEvents;
  });
}
Future<String?> getUserId() async {
  try {
   final storage = await FlutterSecureStorage();

    final String? accessToken = await storage.read(key:'accessToken');
    final Map<String?, dynamic> decodedToken = JwtDecoder.decode(accessToken!);
    return decodedToken['user']['_id'];
  } catch (error) {
    print('Error decoding token: $error');
    return null; // Or handle the error differently
  }
}
Future<void> _fetchUser() async {
     final String? userId = await getUserId();
      if (userId != null) {
  await  userController.fetchUserById(userId); // Use userId if not null
  } else {
    // Handle case where userId is null (e.g., show error message)
  }
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
                  text: " Event Organizers",
                  color: Colors.black,
                  size: 16,
                ),
                    IconButton(onPressed: (){Get.toNamed("/createEvent");}, icon: Icon(Icons.add,size: 35,color: Colors.black,)),
                   ],
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
                      text: " AllEvents",
                      color: Colors.black,
                    ),
                     //SearchTextField(controller: SearchController),
                  ],
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: double.infinity,
                  height: 400,
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
