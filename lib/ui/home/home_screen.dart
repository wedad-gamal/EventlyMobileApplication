import 'package:evently_app/data/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuthService authService = FirebaseAuthService();
    var user = authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${user.displayName}'),
      ),

    );
  }
}
