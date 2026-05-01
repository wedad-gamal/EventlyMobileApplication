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
  String get homeWelcomeBack => 'Welcome Back';

  @override
  String get homeGuestUser => 'Guest';

  @override
  String get homeTab => 'Home';

  @override
  String get favoriteTab => 'Favorite';

  @override
  String get profileTab => 'Profile';

  @override
  String get eventManagementAddEventTitle => 'Add Event';

  @override
  String get eventManagementPleaseChooseDate => 'Please choose a date';

  @override
  String get eventManagementPleaseChooseTime => 'Please choose a time';

  @override
  String get eventManagementEventAddedSuccess => 'Event added successfully!';

  @override
  String get eventManagementTitleLabel => 'Title';

  @override
  String get eventManagementTitleRequired => 'Please enter an event title';

  @override
  String get eventManagementTitleHint => 'Event Title';

  @override
  String get eventManagementDescriptionLabel => 'Description';

  @override
  String get eventManagementDescriptionRequired => 'Please enter a description';

  @override
  String get eventManagementDescriptionHint => 'Event Description...';

  @override
  String get eventManagementEventDate => 'Event Date';

  @override
  String get eventManagementEventTime => 'Event Time';

  @override
  String get eventManagementChooseDate => 'Choose date';

  @override
  String get eventManagementChooseTime => 'Choose time';

  @override
  String get eventManagementAddEventButton => 'Add event';

  @override
  String get eventManagementEditEventTitle => 'Edit Event';

  @override
  String get eventManagementUpdateEventButton => 'Update event';

  @override
  String get eventManagementEventUpdatedSuccess =>
      'Event updated successfully!';

  @override
  String get eventDetailsTitle => 'Event details';

  @override
  String get eventDetailsDescription => 'Description';

  @override
  String get eventDetailsDeleteConfirmation =>
      'Are you sure you want to delete this event?';

  @override
  String get eventDetailsDelete => 'Delete';

  @override
  String get eventDetailsCancel => 'Cancel';

  @override
  String get eventDetailsDeletedSuccess => 'Event deleted successfully!';

  @override
  String get forgetPasswordTitle => 'Forget Password';

  @override
  String get forgetPasswordSend => 'Send';

  @override
  String get resetPasswordTitle => 'Reset Password';

  @override
  String get resetPasswordCheckEmail => 'Check your email';

  @override
  String resetPasswordDescription(String email) {
    return 'We have sent a password reset link to $email. Please check your inbox and follow the instructions to reset your password.';
  }

  @override
  String get resetPasswordBackToLogin => 'Back to Login';

  @override
  String get eventManagementTimeAm => 'AM';

  @override
  String get eventManagementTimePm => 'PM';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingGetStarted => 'Get started';

  @override
  String get onboardingTitle1 => 'Find Events That Inspire You';

  @override
  String get onboardingDescription1 =>
      'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.';

  @override
  String get onboardingTitle2 => 'Effortless Event Planning';

  @override
  String get onboardingDescription2 =>
      'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we\'ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.';

  @override
  String get onboardingTitle3 => 'Connect with Friends & Share Moments';

  @override
  String get onboardingDescription3 =>
      'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.';
}
