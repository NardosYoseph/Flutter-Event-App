import 'dart:io';

import 'package:event_app/app/view/event/widgets/fields/event_description_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 TextEditingController descriptionController=TextEditingController();
  late DateTime _date;
  late TimeOfDay _time;
   String _image="";
  late int _people;

  @override
  void initState() {
    super.initState();
    // Initialize default values
    _date = DateTime.now();
    _time = TimeOfDay.now();
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
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
    }
  }
  Future<void> _selectImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    setState(() {
      _image = pickedImage.path;
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
              EventDescriptionField(controller: descriptionController, description: descriptionController.text),
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
                      'Time: ${_time.format(context)}',
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
  child: _image.isEmpty
      ? Text('Select Image')
      : Image.file(
          File(_image),
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
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: Text('Create Event'),
              ),
            ],
          ),
        ),
      );
  }
}
