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
}
