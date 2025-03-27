import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tevent/core/models/event_model.dart';

class FirebaseUtils {
 
 static  CollectionReference<EventModel>  getEventCollection(){
 return FirebaseFirestore.instance.collection(EventModel.collectionName).withConverter<EventModel>(
      fromFirestore:(snapshot, options) => EventModel.fromFirestore(snapshot.data()!) , 
      toFirestore:(movie, options) =>movie.toFireStore() ,);
  }
 

  static Future<void> addEventToFirestore(EventModel event) {
   var collectionRef=getEventCollection();
   var docRef=collectionRef.doc();
   event.id=docRef.id;
   return docRef.set(event);

}
static Future<void> deleteEvent(String eventId) async {
  await FirebaseFirestore.instance.collection(EventModel.collectionName).doc(eventId).delete();
}
  static Future<void> toggleFavorite(String eventId, bool isFavorite) async {
    await getEventCollection().doc(eventId).update({'isFavorite': !isFavorite});
  }

}
