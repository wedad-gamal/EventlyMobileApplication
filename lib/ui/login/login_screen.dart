import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/utilites/data_validator.dart';
import 'package:evently_app/data/firebase/firebase_auth_service.dart';
import 'package:evently_app/ui/forget_password/forget_password_screen.dart';
import 'package:evently_app/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  bool isGoogleLoading = false; // Separate loader for Google to keep UI clean
  bool isPasswordHidden = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Generic method to handle the login logic
  Future<void> _handleLogin() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        FirebaseAuthService authService = FirebaseAuthService();
        await authService.signInWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
        // No manual navigation needed here if using StreamBuilder!
      } catch (e) {
        _showErrorSnackBar(e.toString());
      } finally {
        if (mounted) setState(() => isLoading = false);
      }
    }
  }

  // Generic method to handle Google Sign In
  Future<void> _handleGoogleSignIn() async {
    setState(() => isGoogleLoading = true);
    try {
      FirebaseAuthService authService = FirebaseAuthService();
      await authService.signInWithGoogle();
      // StreamBuilder handles the transition to HomeScreen
    } catch (e) {
      _showErrorSnackBar("Google Sign-In failed. Please try again.");
    } finally {
      if (mounted) setState(() => isGoogleLoading = false);
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var localization = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        // Added scroll view to prevent overflow on small screens
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Image.asset(
                "assets/images/logo_${provider.assetSuffix}.png",
                width: width * 0.4,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              localization.loginTitle,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        DataValidator.validateEmail(context, value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.sms_outline),
                      hintText: localization.emailLabel,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordHidden,
                    validator: (value) =>
                        DataValidator.validatePassword(context, value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.lock_outline),
                      hintText: localization.passwordLabel,
                      suffixIcon: IconButton(
                        onPressed: () => setState(
                          () => isPasswordHidden = !isPasswordHidden,
                        ),
                        icon: Icon(
                          isPasswordHidden
                              ? Iconsax.eye_slash_outline
                              : Iconsax.eye_outline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                },
                child: Text(localization.forgetPassword),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: isLoading ? null : _handleLogin,
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(localization.loginButton),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(localization.dontHaveAccount),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, SignupScreen.routeName),
                  child: Text(localization.signup),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    localization.or,
                    style: TextStyle(color: theme.colorScheme.primary),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              // Changed to Outlined for Google standard look
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                side: BorderSide(color: theme.colorScheme.primary),
              ),
              onPressed: isGoogleLoading ? null : _handleGoogleSignIn,
              child: isGoogleLoading
                  ? const CircularProgressIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Brand(Brands.google),
                        const SizedBox(width: 12),
                        Text(localization.loginWithGoogle),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
