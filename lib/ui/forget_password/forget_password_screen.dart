import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/utilites/data_validator.dart';
import 'package:evently_app/data/firebase/firebase_auth_service.dart';
import 'package:evently_app/ui/forget_password/reset_password_screen.dart';
import 'package:evently_app/ui/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = "/forget-password";
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSend() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);

    final authService = FirebaseAuthService();
    final error = await authService.sendPasswordResetEmail(
      _emailController.text.trim(),
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (error == null) {
      // Success – navigate to the reset password confirmation screen
      Navigator.pushReplacementNamed(
        context,
        ResetPasswordScreen.routeName,
        arguments: _emailController.text.trim(),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.forgetPasswordTitle),
        leading: CustomBackButton(
          onPress: () => Navigator.pop(context),
        ),
        leadingWidth: 80,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 16),

              // ── Illustration ──────────────────────────────────────────
              Image.asset(
                "assets/images/${provider.isDark ? 'dark_images' : 'light_images'}/reset_password.png",
                height: 250,
              ),
              const SizedBox(height: 32),

              // ── Email Field ───────────────────────────────────────────
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    DataValidator.validateEmail(context, value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.sms_outline),
                  hintText: l10n.emailLabel,
                ),
              ),
              const SizedBox(height: 32),

              // ── Send Button ───────────────────────────────────────────
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                onPressed: _isLoading ? null : _handleSend,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(l10n.forgetPasswordSend),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
