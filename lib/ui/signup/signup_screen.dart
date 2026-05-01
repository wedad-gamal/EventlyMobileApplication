import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/utilites/data_validator.dart';
import 'package:evently_app/data/firebase/firebase_auth_service.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "/signup";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var localization = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 16,
            crossAxisAlignment: .start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset(
                      "assets/images/logo_${provider.assetSuffix}.png",
                      width: width * 0.4,
                    ),
                  ],
                ),
              ),
              Text(
                localization.createAccount,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    TextFormField(
                      validator: (value) =>
                          DataValidator.validateName(context, value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: localization.enterName,
                        prefixIcon: Icon(Iconsax.user_outline),
                      ),
                    ),
                    TextFormField(
                      validator: (value) =>
                          DataValidator.validateEmail(context, value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: localization.enterEmail,
                        prefixIcon: Icon(Iconsax.sms_outline),
                      ),
                    ),
                    TextFormField(
                      validator: (value) =>
                          DataValidator.validatePassword(context, value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      obscureText: isPasswordHidden,
                      decoration: InputDecoration(
                        hintText: localization.enterPassword,
                        prefixIcon: Icon(Iconsax.lock_outline),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          child: Icon(
                            isPasswordHidden
                                ? Iconsax.eye_slash_outline
                                : Iconsax.eye_outline,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) =>
                          DataValidator.validateConfirmPassword(
                            context,
                            value,
                            passwordController.text,
                          ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: confirmPasswordController,
                      obscureText: isConfirmPasswordHidden,
                      decoration: InputDecoration(
                        hintText: localization.confirmPassword,
                        prefixIcon: Icon(Iconsax.lock_outline),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isConfirmPasswordHidden =
                                  !isConfirmPasswordHidden;
                            });
                          },
                          child: Icon(
                            isConfirmPasswordHidden
                                ? Iconsax.eye_slash_outline
                                : Iconsax.eye_outline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 56),
                ),
                onPressed: () async {
                  if (isLoading) return;

                  // 2. ONLY start loading if the form is actually valid
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      FirebaseAuthService authService = FirebaseAuthService();
                      var user = await authService
                          .createAccountWithEmailAndPassword(
                            emailController.text
                                .trim(), // Best practice: trim whitespace
                            passwordController.text,
                            nameController.text.trim(),
                          );

                      // 3. Logic after the async call
                      if (user != null) {
                        // Successful signup
                        if (mounted) {
                          Navigator.pushReplacementNamed(
                            context,
                            LoginScreen.routeName,
                          );
                        }
                      } else {
                        // Handle failed signup (e.g., show a SnackBar)
                        // The isLoading needs to turn off here too
                        setState(() {
                          isLoading = false;
                        });
                      }
                    } catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                },
                child: isLoading
                    ? CircularProgressIndicator(
                        color: theme.colorScheme.surface,
                      )
                    : Text(localization.signUp),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    localization.alreadyHaveAccount,
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routeName,
                      );
                    },
                    child: Text(localization.login),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: theme.colorScheme.secondary.withAlpha(30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      localization.or,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: theme.colorScheme.secondary.withAlpha(30),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (isLoading) return;
                  setState(() {
                    isLoading = true;
                  });
                  FirebaseAuthService authService = FirebaseAuthService();
                  var user = await authService.signInWithGoogle();
                  setState(() {
                    isLoading = false;
                  });
                  if (user != null && mounted) {
                    Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Brand(Brands.google),
                    SizedBox(width: 10),
                    Text(localization.signUpWithGoogle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
