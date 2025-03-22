class EventModel {
static const String collectionName = "Events"; 
  String id;
  String title;
  String description;
  DateTime dateTime;
  String time;
  bool isFavorite;
  String eventName;
  EventModel({
     this.id="",
    required this.title,
    required this.description,
    required this.dateTime,
    required this.time,
    this.isFavorite = false,
    required this.eventName,
  });
  // object to json
  Map<String, dynamic> toFireStore(){
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'time': time,
      'isFavorite': isFavorite,
      'eventName': eventName,
    };
  }
  // json to object
  EventModel.fromFirestore(Map<String, dynamic> data) :this(
    id: data['id']?? '',
    title: data['title']!,
    description: data['description']!,
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']!),
    time: data['time']!,
    isFavorite: data['isFavorite']?? false,
    eventName: data['eventName'],
  );
}