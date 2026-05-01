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
  String get homeWelcomeBack => 'مرحباً بعودتك';

  @override
  String get homeGuestUser => 'ضيف';

  @override
  String get homeTab => 'الرئيسية';

  @override
  String get favoriteTab => 'المفضلة';

  @override
  String get profileTab => 'الملف الشخصي';

  @override
  String get eventManagementAddEventTitle => 'إضافة فعالية';

  @override
  String get eventManagementPleaseChooseDate => 'يرجى اختيار التاريخ';

  @override
  String get eventManagementPleaseChooseTime => 'يرجى اختيار الوقت';

  @override
  String get eventManagementEventAddedSuccess => 'تمت إضافة الفعالية بنجاح!';

  @override
  String get eventManagementTitleLabel => 'العنوان';

  @override
  String get eventManagementTitleRequired => 'يرجى إدخال عنوان الفعالية';

  @override
  String get eventManagementTitleHint => 'عنوان الفعالية';

  @override
  String get eventManagementDescriptionLabel => 'الوصف';

  @override
  String get eventManagementDescriptionRequired => 'يرجى إدخال الوصف';

  @override
  String get eventManagementDescriptionHint => 'وصف الفعالية...';

  @override
  String get eventManagementEventDate => 'تاريخ الفعالية';

  @override
  String get eventManagementEventTime => 'وقت الفعالية';

  @override
  String get eventManagementChooseDate => 'اختر التاريخ';

  @override
  String get eventManagementChooseTime => 'اختر الوقت';

  @override
  String get eventManagementAddEventButton => 'إضافة فعالية';

  @override
  String get eventManagementEditEventTitle => 'تعديل الفعالية';

  @override
  String get eventManagementUpdateEventButton => 'تحديث الفعالية';

  @override
  String get eventManagementEventUpdatedSuccess => 'تم تحديث الفعالية بنجاح!';

  @override
  String get eventDetailsTitle => 'تفاصيل الفعالية';

  @override
  String get eventDetailsDescription => 'الوصف';

  @override
  String get eventDetailsDeleteConfirmation =>
      'هل أنت متأكد من حذف هذه الفعالية؟';

  @override
  String get eventDetailsDelete => 'حذف';

  @override
  String get eventDetailsCancel => 'إلغاء';

  @override
  String get eventDetailsDeletedSuccess => 'تم حذف الفعالية بنجاح!';

  @override
  String get forgetPasswordTitle => 'نسيت كلمة المرور';

  @override
  String get forgetPasswordSend => 'إرسال';

  @override
  String get resetPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get resetPasswordCheckEmail => 'تحقق من بريدك الإلكتروني';

  @override
  String resetPasswordDescription(String email) {
    return 'لقد أرسلنا رابط إعادة تعيين كلمة المرور إلى $email. يرجى التحقق من بريدك الوارد واتباع التعليمات لإعادة تعيين كلمة المرور.';
  }

  @override
  String get resetPasswordBackToLogin => 'العودة لتسجيل الدخول';

  @override
  String get eventManagementTimeAm => 'ص';

  @override
  String get eventManagementTimePm => 'م';

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingGetStarted => 'ابدأ الآن';

  @override
  String get onboardingTitle1 => 'اكتشف فعاليات تُلهمك';

  @override
  String get onboardingDescription1 =>
      'انغمس في عالم من الفعاليات المصممة لتناسب اهتماماتك الفريدة. سواء كنت مهتمًا بالموسيقى الحية أو ورش العمل الفنية أو التواصل المهني أو مجرد اكتشاف تجارب جديدة، لدينا ما يناسب الجميع. ستساعدك توصياتنا المختارة على الاستكشاف والتواصل وتحقيق أقصى استفادة من كل فرصة حولك.';

  @override
  String get onboardingTitle2 => 'تخطيط فعاليات بلا جهد';

  @override
  String get onboardingDescription2 =>
      'تخلص من عناء تنظيم الفعاليات مع أدوات التخطيط الشاملة. من إعداد الدعوات وإدارة الحضور إلى جدولة التذكيرات وتنسيق التفاصيل، نحن نتولى كل شيء. خطط بسهولة وركز على ما يهم – إنشاء تجربة لا تُنسى لك ولضيوفك.';

  @override
  String get onboardingTitle3 => 'تواصل مع الأصدقاء وشارك اللحظات';

  @override
  String get onboardingDescription3 =>
      'اجعل كل فعالية لا تُنسى من خلال مشاركة التجربة مع الآخرين. تتيح لك منصتنا دعوة الأصدقاء وإبقاء الجميع على اطلاع والاحتفال باللحظات معًا. التقط وشارك الحماس مع شبكتك، حتى تتمكن من إعادة عيش اللحظات المميزة والاعتزاز بالذكريات.';
}
