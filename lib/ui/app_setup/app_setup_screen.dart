import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/ui/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSetupScreen extends StatelessWidget {
  static const String routeName = "/app_setup";
  const AppSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<AppConfigProvider>(context);
    var localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .center,
                children: [
                  Image.asset(
                    "assets/images/logo_${provider.isDark ? "dark" : "light"}.png",
                    width: width * 0.4,
                  ),
                ],
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/app_setup_${provider.isDark ? "dark" : "light"}.png",
                ),
              ),
              Text(
                localization.personalizeTitle,
                style: TextTheme.of(context).titleLarge,
              ),
              Text(
                localization.personalizeDescription,
                style: TextTheme.of(context).bodyLarge,
              ),
              Row(
                children: [
                  Text(
                    localization.languageLabel,
                    style: TextTheme.of(
                      context,
                    ).titleMedium?.copyWith(color: AppColors.lightMain),
                  ),
                  Spacer(),
                  _buildItemSelector(
                    Text(
                      localization.english,
                      style: TextTheme.of(context).labelMedium?.copyWith(
                        color: provider.isEnglish
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    provider.isEnglish,
                    () {
                      provider.changeLocal("en");
                    },
                    context,
                  ),
                  SizedBox(width: 8),
                  _buildItemSelector(
                    Text(
                      localization.arabic,
                      style: TextTheme.of(context).labelMedium?.copyWith(
                        color: provider.isEnglish
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    !provider.isEnglish,
                    () {
                      provider.changeLocal("ar");
                    },
                    context,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    localization.themeLabel,
                    style: TextTheme.of(
                      context,
                    ).titleMedium?.copyWith(color: AppColors.lightMain),
                  ),
                  Spacer(),
                  _buildItemSelector(
                    Icon(
                      Icons.light_mode,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    !provider.isDark,
                    () {
                      provider.changeTheme(ThemeMode.light);
                    },
                    context,
                  ),
                  SizedBox(width: 8),
                  _buildItemSelector(
                    Icon(
                      Icons.dark_mode,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    provider.isDark,
                    () {
                      provider.changeTheme(ThemeMode.dark);
                    },
                    context,
                  ),
                ],
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    OnBoardingScreen.routeName,
                  );
                },
                child: Text(localization.letsStart),
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 56),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemSelector(
    Widget content,
    bool isSelected,
    VoidCallback onTap,
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.lightMain
              : AppColors.lightMain.withAlpha(40),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.lightMain, width: 1),
        ),
        child: content,
      ),
    );
  }
}
