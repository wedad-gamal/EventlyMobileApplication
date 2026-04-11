// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get personalizeTitle => 'Personalize Your Experience';

  @override
  String get personalizeDescription =>
      'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.';

  @override
  String get languageLabel => 'Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get themeLabel => 'Theme';

  @override
  String get letsStart => 'Let’s start';

  @override
  String get loginTitle => 'Login to your account';

  @override
  String get emailLabel => 'Enter your email';

  @override
  String get passwordLabel => 'Enter your password';

  @override
  String get forgetPassword => 'Forget Password?';

  @override
  String get loginButton => 'Login';

  @override
  String get dontHaveAccount => 'Don\'t have an account ?';

  @override
  String get signup => 'Signup';

  @override
  String get or => 'Or';

  @override
  String get loginWithGoogle => 'Login with Google';

  @override
  String get createAccount => 'Create your account';

  @override
  String get enterName => 'Enter your name';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get confirmPassword => 'Confirm your password';

  @override
  String get signUp => 'Sign up';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get login => 'Login';

  @override
  String get signUpWithGoogle => 'Sign up with Google';

  @override
  String get nameEmpty => 'Name cannot be empty';

  @override
  String get nameInvalid => 'Please enter a valid name';

  @override
  String get emailEmpty => 'Email cannot be empty';

  @override
  String get emailInvalid => 'Please enter a valid email';

  @override
  String get passwordEmpty => 'Password cannot be empty';

  @override
  String get passwordTooShort => 'Password must be at least 8 characters';

  @override
  String get confirmPasswordEmpty => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String welcomeMessage(String name) {
    return 'Welcome, $name';
  }

  @override
  String get homeTab => 'Home';

  @override
  String get favoriteTab => 'Favorite';

  @override
  String get profileTab => 'Profile';
}
