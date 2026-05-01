import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/utilites/shared_preferences_keys.dart';
import 'package:evently_app/ui/app_setup/app_setup_screen.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/widgets/auth_wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var user = FirebaseAuth.instance.currentUser;

    Future.delayed(const Duration(seconds: 3), () async {
      final pref = await SharedPreferences.getInstance();

      bool isFirstTime =
          pref.getBool(SharedPreferencesKeys.isFirstTime.value) ?? true;
      Navigator.pushReplacementNamed(
        context,
        isFirstTime
            ? AppSetupScreen.routeName
            : user != null
            ? HomeScreen.routeName
            : AuthWrapper.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(),
            Expanded(
              child: Image.asset(
                "assets/images/logo_${provider.isDark ? "dark" : "light"}.png",
                width: width * 0.85,
              ),
            ),
            Image.asset(
              "assets/images/branding_${provider.isDark ? "dark" : "light"}.png",
              width: width * 0.6,
            ),
          ],
        ),
      ),
    );
  }
}
