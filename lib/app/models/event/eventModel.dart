

class Event {
  final String? id;
  final String title;
  final String description;
  final DateTime date;
  final String time;
  final double price;
  final int? availableTickets;
  final String image;
  final String? eventOrganizer;
  final String status;
List<dynamic>? attendees;
  Event({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.price,
    required this.availableTickets,
    required this.image,
    required this.status,
     this.eventOrganizer,
     this.attendees
  });


  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      time: json['time'],
      image: json['image'],
      price: json['price'] != null ? json['price'].toDouble() : 0.0,
      availableTickets: json['availableTickets'],
      attendees: json['attendees'],
      status: json['status'],
      eventOrganizer: json['eventOrganizer'],
      
    );
  }

  //  Future<FormData> toFormData() async {
  //   FormData formData = FormData();

  //   formData.fields.add(MapEntry('description', description));
  //   formData.fields.add(MapEntry('date', date.toIso8601String()));
  //   formData.fields.add(MapEntry('time', time));
  //   formData.fields.add(MapEntry('rate', rate.toString()));
  //   formData.fields.add(MapEntry('people', people.toString()));
  
  // // File imageFile = image;
  // formData.files.add(MapEntry(
  //   'image',
  //   await MultipartFile.fromFile(
  //     image,
  //     filename: image.split('/').last,
  //     contentType: MediaType('image',  'jpeg'), // Adjust according to your file type
  //   ),
  // ));
  //   return formData;
  // }

Map<String, dynamic> toJson() => {
  '_id': id,
  'title':title,
    'description': description,
    'date': date.toIso8601String(), 
    'time': time,
    'image': image,
    'price': price,
    'status':status,
    'eventOrganizer':eventOrganizer,
    'availableTickets': availableTickets,
  };
}