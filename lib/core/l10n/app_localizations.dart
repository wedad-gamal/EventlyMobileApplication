import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @personalizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Personalize Your Experience'**
  String get personalizeTitle;

  /// No description provided for @personalizeDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.'**
  String get personalizeDescription;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @themeLabel.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeLabel;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Let’s start'**
  String get letsStart;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get loginTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordLabel;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account ?'**
  String get dontHaveAccount;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signup;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginWithGoogle;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get createAccount;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterName;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get confirmPassword;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signUpWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get signUpWithGoogle;

  /// No description provided for @nameEmpty.
  ///
  /// In en, this message translates to:
  /// **'Name cannot be empty'**
  String get nameEmpty;

  /// No description provided for @nameInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid name'**
  String get nameInvalid;

  /// No description provided for @emailEmpty.
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty'**
  String get emailEmpty;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get emailInvalid;

  /// No description provided for @passwordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get passwordEmpty;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordTooShort;

  /// No description provided for @confirmPasswordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPasswordEmpty;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcomeMessage(String name);

  /// No description provided for @homeWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get homeWelcomeBack;

  /// No description provided for @homeGuestUser.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get homeGuestUser;

  /// No description provided for @homeTab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTab;

  /// No description provided for @favoriteTab.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favoriteTab;

  /// No description provided for @profileTab.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTab;

  /// App bar title on the add/edit event screen
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get eventManagementAddEventTitle;

  /// No description provided for @eventManagementPleaseChooseDate.
  ///
  /// In en, this message translates to:
  /// **'Please choose a date'**
  String get eventManagementPleaseChooseDate;

  /// No description provided for @eventManagementPleaseChooseTime.
  ///
  /// In en, this message translates to:
  /// **'Please choose a time'**
  String get eventManagementPleaseChooseTime;

  /// No description provided for @eventManagementEventAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Event added successfully!'**
  String get eventManagementEventAddedSuccess;

  /// No description provided for @eventManagementTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get eventManagementTitleLabel;

  /// No description provided for @eventManagementTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter an event title'**
  String get eventManagementTitleRequired;

  /// No description provided for @eventManagementTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get eventManagementTitleHint;

  /// No description provided for @eventManagementDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get eventManagementDescriptionLabel;

  /// No description provided for @eventManagementDescriptionRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a description'**
  String get eventManagementDescriptionRequired;

  /// No description provided for @eventManagementDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Event Description...'**
  String get eventManagementDescriptionHint;

  /// No description provided for @eventManagementEventDate.
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get eventManagementEventDate;

  /// No description provided for @eventManagementEventTime.
  ///
  /// In en, this message translates to:
  /// **'Event Time'**
  String get eventManagementEventTime;

  /// No description provided for @eventManagementChooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose date'**
  String get eventManagementChooseDate;

  /// No description provided for @eventManagementChooseTime.
  ///
  /// In en, this message translates to:
  /// **'Choose time'**
  String get eventManagementChooseTime;

  /// No description provided for @eventManagementAddEventButton.
  ///
  /// In en, this message translates to:
  /// **'Add event'**
  String get eventManagementAddEventButton;

  /// No description provided for @eventManagementEditEventTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get eventManagementEditEventTitle;

  /// No description provided for @eventManagementUpdateEventButton.
  ///
  /// In en, this message translates to:
  /// **'Update event'**
  String get eventManagementUpdateEventButton;

  /// No description provided for @eventManagementEventUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Event updated successfully!'**
  String get eventManagementEventUpdatedSuccess;

  /// No description provided for @eventDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Event details'**
  String get eventDetailsTitle;

  /// No description provided for @eventDetailsDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get eventDetailsDescription;

  /// No description provided for @eventDetailsDeleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this event?'**
  String get eventDetailsDeleteConfirmation;

  /// No description provided for @eventDetailsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get eventDetailsDelete;

  /// No description provided for @eventDetailsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get eventDetailsCancel;

  /// No description provided for @eventDetailsDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Event deleted successfully!'**
  String get eventDetailsDeletedSuccess;

  /// No description provided for @forgetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forgetPasswordTitle;

  /// No description provided for @forgetPasswordSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get forgetPasswordSend;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordCheckEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get resetPasswordCheckEmail;

  /// No description provided for @resetPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'We have sent a password reset link to {email}. Please check your inbox and follow the instructions to reset your password.'**
  String resetPasswordDescription(String email);

  /// No description provided for @resetPasswordBackToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get resetPasswordBackToLogin;

  /// No description provided for @eventManagementTimeAm.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get eventManagementTimeAm;

  /// No description provided for @eventManagementTimePm.
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get eventManagementTimePm;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingGetStarted;

  /// Title for the first onboarding page
  ///
  /// In en, this message translates to:
  /// **'Find Events That Inspire You'**
  String get onboardingTitle1;

  /// Description for the first onboarding page
  ///
  /// In en, this message translates to:
  /// **'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'**
  String get onboardingDescription1;

  /// Title for the second onboarding page
  ///
  /// In en, this message translates to:
  /// **'Effortless Event Planning'**
  String get onboardingTitle2;

  /// Description for the second onboarding page
  ///
  /// In en, this message translates to:
  /// **'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we\'ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'**
  String get onboardingDescription2;

  /// Title for the third onboarding page
  ///
  /// In en, this message translates to:
  /// **'Connect with Friends & Share Moments'**
  String get onboardingTitle3;

  /// Description for the third onboarding page
  ///
  /// In en, this message translates to:
  /// **'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'**
  String get onboardingDescription3;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
