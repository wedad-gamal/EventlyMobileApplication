import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/data/firebase/firebase_event_database.dart';
import 'package:evently_app/data/models/category.dart';
import 'package:evently_app/data/models/event.dart';
import 'package:evently_app/ui/event_management/event_details.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventCard extends StatefulWidget {
  final Event event;
  late final Category category;
  EventCard({super.key, required this.event}) {
    category = allCategories[event.categoryId]!;
  }

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  FirebaseEventDatabase database = FirebaseEventDatabase();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppConfigProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          EventDetailsScreen.routeName,
          arguments: widget.event,
        );
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage(
                provider.isDark ? widget.category.imageDark : widget.category.imageLight,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: theme.colorScheme.primary.withAlpha(30),
                  ),
                  child: Text(
                    DateFormat("dd MMM").format(widget.event.date),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: theme.colorScheme.primary.withAlpha(30),
                        ),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              widget.event.title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            GestureDetector(
                              onTap: () {
                                database.toggleFavorite(widget.event);
                              },
                              child: widget.event.isFavorite ? Icon(Iconsax.heart_bold) : Icon(Iconsax.heart_outline),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
