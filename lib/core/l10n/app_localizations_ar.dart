// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get personalizeTitle => 'خص تجربتك';

  @override
  String get personalizeDescription =>
      'اختر اللغة والمظهر المفضلين لديك للبدء بتجربة مخصصة ومريحة تناسب ذوقك.';

  @override
  String get languageLabel => 'اللغة';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get themeLabel => 'المظهر';

  @override
  String get letsStart => 'لنبدأ';

  @override
  String get loginTitle => 'تسجيل الدخول إلى حسابك';

  @override
  String get emailLabel => 'أدخل بريدك الإلكتروني';

  @override
  String get passwordLabel => 'أدخل كلمة المرور';

  @override
  String get forgetPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get loginButton => 'تسجيل الدخول';

  @override
  String get dontHaveAccount => 'ليس لديك حساب ؟';

  @override
  String get signup => 'إنشاء حساب';

  @override
  String get or => 'أو';

  @override
  String get loginWithGoogle => 'تسجيل الدخول باستخدام جوجل';

  @override
  String get createAccount => 'إنشاء حسابك';

  @override
  String get enterName => 'أدخل اسمك';

  @override
  String get enterEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get enterPassword => 'أدخل كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get signUp => 'تسجيل';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get signUpWithGoogle => 'التسجيل باستخدام جوجل';

  @override
  String get nameEmpty => 'الاسم لا يمكن أن يكون فارغاً';

  @override
  String get nameInvalid => 'يرجى إدخال اسم صحيح';

  @override
  String get emailEmpty => 'البريد الإلكتروني لا يمكن أن يكون فارغاً';

  @override
  String get emailInvalid => 'يرجى إدخال بريد إلكتروني صحيح';

  @override
  String get passwordEmpty => 'كلمة المرور لا يمكن أن تكون فارغة';

  @override
  String get passwordTooShort => 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';

  @override
  String get confirmPasswordEmpty => 'يرجى تأكيد كلمة المرور';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String welcomeMessage(String name) {
    return 'مرحباً، $name';
  }

  @override
  String get homeTab => 'الرئيسية';

  @override
  String get favoriteTab => 'المفضلة';

  @override
  String get profileTab => 'الملف الشخصي';
}
