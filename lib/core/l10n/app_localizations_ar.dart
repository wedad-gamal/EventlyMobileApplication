// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get personalizeTitle => 'خصص تجربتك';

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
}
