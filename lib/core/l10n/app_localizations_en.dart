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
  String get login_title => 'Login to your account';

  @override
  String get email_placeholder => 'Enter your email';

  @override
  String get password_placeholder => 'Enter your password';

  @override
  String get forgot_password => 'Forget Password?';

  @override
  String get login_button => 'Login';

  @override
  String get no_account_prompt => 'Don\'t have an account ?';

  @override
  String get signup_link => 'Signup';

  @override
  String get divider_or => 'Or';

  @override
  String get google_login => 'Login with Google';

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
  String get or => 'Or';

  @override
  String get signUpWithGoogle => 'Sign up with Google';

  @override
  String get nameEmpty => 'Please enter your name';

  @override
  String get nameInvalid => 'Name must contain only English or Arabic letters';

  @override
  String get emailEmpty => 'Please enter your email';

  @override
  String get emailInvalid => 'Please enter a valid email address';

  @override
  String get passwordEmpty => 'Please enter your password';

  @override
  String get passwordTooShort => 'Password must be at least 8 characters';

  @override
  String get confirmPasswordEmpty => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';
}
