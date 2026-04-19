import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/data/firebase/firebase_auth_service.dart';
import 'package:evently_app/data/models/category.dart';
import 'package:evently_app/ui/event_management/event_management_screen.dart';
import 'package:evently_app/ui/home/tabs/favorite/favorite_tab.dart';
import 'package:evently_app/ui/home/tabs/home/home_tab.dart';
import 'package:evently_app/ui/home/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> tabs = [
    HomeTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  int selectedIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    FirebaseAuthService authService = FirebaseAuthService();
    final provider = context.watch<AppConfigProvider>();
    var theme = Theme.of(context);
    var user = authService.currentUser;

    return Scaffold(
     
      body: tabs[selectedIndex],
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withAlpha(30),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, EventManagementScreen.routeName);
          },

          child: Icon(Icons.add),
        ),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            if (selectedIndex == index) return;
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: const Icon(Iconsax.home_bold),
              icon: const Icon(Iconsax.home_outline),
              label: localization.homeTab,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Iconsax.heart_bold),
              icon: const Icon(Iconsax.heart_outline),
              label: localization.favoriteTab,
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Iconsax.user_bold),
              icon: const Icon(Iconsax.user_outline),
              label: localization.profileTab,
            ),
          ],
        ),
      ),
    );
  }
}
