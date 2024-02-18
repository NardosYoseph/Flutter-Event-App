import 'dart:io';
import 'package:dio/dio.dart'as dio;
import 'package:event_app/app/controllers/event_controllers/event_controller.dart';
import 'package:event_app/app/models/event/eventModel.dart';
import 'package:event_app/app/view/event/widgets/fields/event_description_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  EventController eventController = Get.put(EventController());
  TextEditingController descriptionController = TextEditingController();
  String _convertTimeOfDayToString(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final time = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  return DateFormat('HH:mm').format(time);
}

  late DateTime _date;
  String _time ="";
  late TimeOfDay _timeOfDay;
  double _rate = 0;
  File? _image ;
  late int _people;

  @override
  void initState() {
    super.initState();
    // Initialize default values
    _date = DateTime.now();
    _timeOfDay = TimeOfDay.now();
    _people = 0;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _timeOfDay);
    if (picked != null && picked != _timeOfDay) {
      setState(() {
        _timeOfDay = picked;
      });
    }
  }

  Future<void> _selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            EventDescriptionField(
                controller: descriptionController,
                description: descriptionController.text),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Date: ${DateFormat('yyyy-MM-dd').format(_date)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Time: ${_timeOfDay.format(context)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectTime(context),
                  child: Text('Select Time'),
                ),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _selectImage,
             child: _image == null
                  ? Text('Select Image')
                  : Image.file(
                      _image!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'maximum People'),
              keyboardType: TextInputType.number,
              validator: (value) {
                // Implement validation logic if needed
                return null;
              },
              onSaved: (value) => _people = int.parse(value!),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _time=_convertTimeOfDayToString(_timeOfDay);
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Event event = Event(
                      description: descriptionController.text,
                      date: _date,
                      time: _time,
                      image: _image!,
                      rate: _rate,
                      people: _people);

                      


                  eventController.CreateEvent(context,event );
                }
                print(_image);
              },
              child: Text('Create Event'),
            ),
          ],
        ),
      ),
    );
  }
}
