import 'package:cloud_firestore/cloud_firestore.dart';

class Event{
  String id;
  String title;
  String description;
  DateTime date;
  DateTime time;
  String categoryId;
  String userId;
  bool isFavorite;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.categoryId,
    required this.userId,
    this.isFavorite = false
  });
   factory Event.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Event(
      id: snapshot.id,
      title: data?['title'] ?? '',
      description: data?['description'] ?? '',
      date: (data?['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      time: (data?['time'] as Timestamp?)?.toDate() ?? DateTime.now(),
      categoryId: data?['categoryId'] ?? '',
      userId: data?['userId'] ?? '',
      isFavorite: data?['isFavorite'] ?? false,
 
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": Timestamp.fromDate(date),
      "time": Timestamp.fromDate(time),
      "categoryId": categoryId,
      "userId": userId,
      "isFavorite": isFavorite
    };
  }
}