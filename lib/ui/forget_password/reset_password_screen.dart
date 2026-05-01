import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/ui/login/login_screen.dart';
import 'package:evently_app/ui/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = "/reset-password";
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The email address that the reset link was sent to
    final email = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.resetPasswordTitle),
        leading: CustomBackButton(
          onPress: () => Navigator.pop(context),
        ),
        leadingWidth: 80,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),

            // ── Illustration ──────────────────────────────────────────
            Image.asset(
              "assets/images/${provider.isDark ? 'dark_images' : 'light_images'}/reset_password.png",
              height: 250,
            ),
            const SizedBox(height: 32),

            // ── Success Icon ──────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withAlpha(20),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.mark_email_read_outlined,
                size: 48,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),

            // ── Title ─────────────────────────────────────────────────
            Text(
              l10n.resetPasswordCheckEmail,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // ── Description ───────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                l10n.resetPasswordDescription(email),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.secondary.withAlpha(180),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),

            // ── Back to Login Button ──────────────────────────────────
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginScreen.routeName,
                  (route) => false,
                );
              },
              child: Text(l10n.resetPasswordBackToLogin),
            ),
          ],
        ),
      ),
    );
  }
}
