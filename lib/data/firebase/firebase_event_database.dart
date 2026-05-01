import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/data/models/event.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseEventDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Event> get eventsCollection => _firestore
      .collection('events')
      .withConverter<Event>(
        fromFirestore: (snapshot, options) =>
            Event.fromFirestore(snapshot, options),
        toFirestore: (event, _) => event.toFirestore(),
      );

  Future<void> addEvent(Event event) async {
    var doc = eventsCollection.doc();
    event.id = doc.id;
    await doc.set(event);
  }

  Future<DocumentSnapshot<Event>> getEvent(String id) async {
    return eventsCollection.doc(id).get();
  }

  Future<void> updateEvent(Event event) async {
    await eventsCollection.doc(event.id).set(event, SetOptions(merge: true));
  }

  Future<void> deleteEvent(String id) async {
    await eventsCollection.doc(id).delete();
  }

  Future<QuerySnapshot<Event>> getAllEvents() async =>
      await eventsCollection.get();

  Stream<QuerySnapshot<Event>> getEventsStream() =>
      eventsCollection.snapshots();

  Stream<QuerySnapshot<Event>> getEvents({String? categoryId, bool checkIsFavorite= false}) {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    Query<Event> query = eventsCollection.where('userId', isEqualTo: uid);

    if (categoryId != null && categoryId.isNotEmpty) {
      query = query.where('categoryId', isEqualTo: categoryId);
    }

    if(checkIsFavorite){
      query = query.where('isFavorite', isEqualTo: true);
    }    

    return query.snapshots();
  }

  Future<void> toggleFavorite(Event event)async{
    event.isFavorite = !event.isFavorite;
    eventsCollection.doc(event.id).set(event , SetOptions(merge: true));
  }

  
}
