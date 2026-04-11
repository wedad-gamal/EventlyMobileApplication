import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/utilites/data_validator.dart';
import 'package:evently_app/data/firebase/firebase_auth_service.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/signup/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isPasswordHidden = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var localization = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: .start,
          children: [
            SafeArea(child: Row(
              mainAxisAlignment: .center,
              children: [
                Image.asset("assets/images/logo_${provider.assetSuffix}.png", width: width* 0.4,)
              ],
            )),
            Text(localization.loginTitle, style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary),),
            Form(
              key: formKey,
              child: Column(
                spacing: 16,
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: (value) => DataValidator.validateEmail(context, value),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.sms_outline),
                        hintText: localization.emailLabel
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordHidden,
                    validator: (value) =>  DataValidator.validatePassword(context, value),
                    decoration: InputDecoration(

                        prefixIcon: Icon(Iconsax.lock_outline),
                        hintText: localization.passwordLabel,
                        suffixIcon: InkWell(
                            onTap: (){
                              setState(() {
                                isPasswordHidden = !isPasswordHidden;
                              });
                            },
                            child: Icon(isPasswordHidden?Iconsax.eye_slash_outline:Iconsax.eye_outline)
                        )

                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: .end,
              children: [
                TextButton(onPressed: (){
                  //todo navigate to forget password screen
                }, child: Text(localization.forgetPassword,))
              ],
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 56)
              ),
              onPressed: ()async{
                if(formKey.currentState!.validate()){
                  setState(() {
                    isLoading= true;
                  });
                  FirebaseAuthService authService = FirebaseAuthService();
                  var user = await authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
                  debugPrint(user?.uid);
                  debugPrint(user?.displayName);
                  setState(() {
                    isLoading= false;
                  });
                  if(user != null){
                    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  }
                }

              }, child: isLoading? CircularProgressIndicator(color: theme.colorScheme.surface,): Text(localization.loginButton),),

            Row(
              mainAxisAlignment: .center,
              children: [
                Text(localization.dontHaveAccount, style: theme.textTheme.bodyMedium,),
                TextButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, SignupScreen.routeName);
                }, child: Text(localization.signup))
              ],
            ),
            Row(
              children: [
                Expanded(child: Divider(color: theme.colorScheme.secondary.withAlpha(30),)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(localization.or, style: theme.textTheme.titleSmall?.copyWith( color: theme.colorScheme.primary),),
                ),
                Expanded(child: Divider(color: theme.colorScheme.secondary.withAlpha(30),)),
              ],
            ),
            ElevatedButton(onPressed: (){}, child: Row(
              mainAxisAlignment: .center,
              children: [
              Brand(Brands.google),
              SizedBox(width: 10,),
              Text(localization.loginWithGoogle)
            ],))

          ],
        ),
      ),
    );
  }
}
