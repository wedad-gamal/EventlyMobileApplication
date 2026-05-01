import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/login/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  static const String routeName = "/auth_wrapper";

  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 2. If snapshot has user data, they are logged in
        if (snapshot.hasData) {
          return const HomeScreen();
        }

        // 3. Otherwise, they are logged out (snapshot.data is null)
        return const LoginScreen();
      },
    );
  }
}
