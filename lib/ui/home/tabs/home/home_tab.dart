import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/utilites/extension.dart';
import 'package:evently_app/data/firebase/firebase_auth_service.dart';
import 'package:evently_app/data/firebase/firebase_event_database.dart';
import 'package:evently_app/data/models/category.dart';
import 'package:evently_app/data/models/event.dart';
import 'package:evently_app/ui/home/widgets/category_tabs.dart';
import 'package:evently_app/ui/home/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final FirebaseEventDatabase database = FirebaseEventDatabase();

  List<Category> categories = [];
  late Category selectedCategory;
  @override
  void initState() {
    super.initState();
    categories.add(
      Category(
        id: "",
        nameEn: "all",
        nameAr: "الكل",
        imageDark: "",
        imageLight: "",
        icon: Iconsax.category_bold,
      ),
    );
    categories.addAll(allCategories.values);
    selectedCategory = categories.first;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    FirebaseAuthService authService = FirebaseAuthService();
    final provider = context.watch<AppConfigProvider>();

    var theme = Theme.of(context);
    var user = authService.currentUser;
    return Scaffold(
      appBar: AppBar(
        // ── Left: greeting ──────────────────────────────────────────────
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${localization.homeWelcomeBack} ✨",
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.secondary.withAlpha(90),
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(user?.displayName??"", style: theme.textTheme.titleMedium),
          ],
        ),
        centerTitle: false,

        // ── Right: lang toggle + theme toggle ───────────────────────────
        actions: [
          // Theme toggle
          IconButton(
            tooltip: provider.isDark ? 'Switch to light' : 'Switch to dark',
            icon: Icon(
              provider.isDark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color: theme.colorScheme.primary,
            ),
            onPressed: () => provider.changeTheme(
              provider.isDark ? ThemeMode.light : ThemeMode.dark,
            ),
          ),

          // Language toggle
          GestureDetector(
            onTap: () => provider.changeLocal(provider.isEnglish ? 'ar' : 'en'),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                provider.isEnglish ? 'AR' : 'EN',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.surface,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
        ],

        bottom: PreferredSize(
          preferredSize: Size(0, 50),
          child: CategoryTabs(
            categories: categories,
            tabOnPress: (index) {
              setState(() {
                selectedCategory = categories[index];
              });
            },
            selectedCategory: selectedCategory,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Event>>(
        stream: database.getEvents(categoryId: selectedCategory.id),
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
      ),
    );
  }
}
