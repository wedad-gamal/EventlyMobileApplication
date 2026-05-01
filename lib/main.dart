import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/theme/app_theme.dart';
import 'package:evently_app/core/utilites/shared_preferences_keys.dart';
import 'package:evently_app/ui/app_setup/app_setup_screen.dart';
import 'package:evently_app/ui/event_management/event_details.dart';
import 'package:evently_app/ui/event_management/event_management_screen.dart';
import 'package:evently_app/ui/forget_password/forget_password_screen.dart';
import 'package:evently_app/ui/forget_password/reset_password_screen.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/login/login_screen.dart';
import 'package:evently_app/ui/on_boarding/on_boarding_screen.dart';
import 'package:evently_app/ui/signup/signup_screen.dart';
import 'package:evently_app/ui/splash/splash_screen.dart';
import 'package:evently_app/ui/widgets/auth_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(EventlyApplication());
}

class EventlyApplication extends StatefulWidget {
  const EventlyApplication({super.key});

  @override
  State<EventlyApplication> createState() => _EventlyApplicationState();
}

class _EventlyApplicationState extends State<EventlyApplication> {
  late AppConfigProvider provider;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return AppConfigProvider();
      },
      child: Consumer<AppConfigProvider>(
        builder: (context, provider, child) {
          this.provider = provider;
          return MaterialApp(
            //localization
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(provider.local),
            //
            debugShowCheckedModeBanner: false,
            themeMode: provider.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            initialRoute: SplashScreen.routeName,
            routes: {
              AuthWrapper.routeName: (_) => const AuthWrapper(),
              ForgetPasswordScreen.routeName: (_) =>
                  const ForgetPasswordScreen(),
              ResetPasswordScreen.routeName: (_) => const ResetPasswordScreen(),
              SplashScreen.routeName: (context) => const SplashScreen(),
              OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
              AppSetupScreen.routeName: (context) => const AppSetupScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              SignupScreen.routeName: (context) => const SignupScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              EventManagementScreen.routeName: (context) =>
                  const EventManagementScreen(),
              EventDetailsScreen.routeName: (context) =>
                  const EventDetailsScreen(),
            },
          );
        },
      ),
    );
  }

  Future<void> init() async {
    final pref = await SharedPreferences.getInstance();
    var local = pref.getString(SharedPreferencesKeys.local.value) ?? "en";
    var isDark = pref.getBool(SharedPreferencesKeys.isDark.value) ?? false;

    provider.changeTheme(isDark ? ThemeMode.dark : ThemeMode.light);
    provider.changeLocal(local);
  }
}
