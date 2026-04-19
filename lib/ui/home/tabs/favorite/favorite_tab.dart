import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/utilites/extension.dart';
import 'package:evently_app/data/firebase/firebase_event_database.dart';
import 'package:evently_app/data/models/event.dart';
import 'package:evently_app/ui/home/widgets/event_card.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  FirebaseEventDatabase database = FirebaseEventDatabase();
  FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot<Event>>(
        stream: database.getEvents(checkIsFavorite: true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: "An error has occurred - ${snapshot.error}".toBodyText(
                context,
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: "No Data Available".toBodyText(context));
          }

          
          final docs =snapshot.data!.docs;                    

          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: docs.length,
            separatorBuilder: (context, index) => 16.verticalSpace,
            itemBuilder: (context, index) {
              final event = docs[index].data();
              return EventCard(event: event);
            },
          );
        },
      );
  }
}