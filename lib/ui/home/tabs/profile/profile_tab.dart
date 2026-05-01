import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/utilites/appDialog.dart';
import 'package:evently_app/data/firebase/firebase_auth_service.dart';
import 'package:evently_app/ui/widgets/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuthService authService = FirebaseAuthService();
    final provider = context.watch<AppConfigProvider>();
    var theme = Theme.of(context);
    var user = authService.currentUser;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset("assets/images/route_logo.png"),
              SizedBox(height: 20),
              Text(
                user?.displayName ?? "No data",
                style: theme.textTheme.titleLarge,
              ),
              Text(user?.email ?? "", style: theme.textTheme.bodyLarge),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSecondary,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Text("Dark Mode", style: theme.textTheme.titleMedium),
                    Spacer(),
                    Switch(
                      value: provider.isDark,
                      onChanged: (value) {
                        provider.changeTheme(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSecondary,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Text("Language", style: theme.textTheme.titleMedium),
                    Spacer(),
                    Switch(
                      value: provider.isEnglish,
                      onChanged: (value) {
                        provider.changeLocal(value ? "en" : "ar");
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  AppDialog.showDialogMessage(
                    context,
                    "Are you sure?",
                    postActionText: "Cancel",
                    negativeActionText: "Ok",
                    onNegativeAction: () async {
                      await authService.logout();
                      if (context.mounted) {
                        Navigator.pushReplacementNamed(
                          context,
                          AuthWrapper.routeName,
                        );
                      }
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSecondary,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Text("Logout", style: theme.textTheme.titleMedium),
                      Spacer(),
                      Icon(Icons.logout, color: theme.colorScheme.error),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
