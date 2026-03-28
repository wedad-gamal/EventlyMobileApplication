import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

abstract class DataValidator {
  static String? validateName(BuildContext context,String? value) {
    final localization = AppLocalizations.of(context)!;
    // 1. Check if the field is empty
    if (value == null || value.trim().isEmpty) {
      return localization.nameEmpty;
    }

    // 2. Define the Regex pattern
    // English range: a-zA-Z
    // Arabic range: \u0600-\u06FF
    // Also allows spaces to support first and last names
    String pattern = r"^[a-zA-Z\u0600-\u06FF\s]+$";
    RegExp regex = RegExp(pattern);

    // 3. Validate against the pattern
    if (!regex.hasMatch(value)) {
      return localization.nameInvalid;
    }

    return null; // Return null if the input is valid
  }
  static String? validateEmail(BuildContext context, String? value) {
    final localization = AppLocalizations.of(context)!;

    if (value == null || value.trim().isEmpty) {
      return localization.emailEmpty;
    }

    // Standard Email Regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return localization.emailInvalid;
    }
    return null;
  }

  // 2. Password Validator
  static String? validatePassword(BuildContext context, String? value) {
    final localization = AppLocalizations.of(context)!;

    if (value == null || value.isEmpty) {
      return localization.passwordEmpty;
    }
    if (value.length < 8) {
      return localization.passwordTooShort;
    }
    return null;
  }

  // 3. Confirm Password Validator
  static String? validateConfirmPassword(
      BuildContext context,
      String? value,
      String originalPassword,
      ) {
    final localization = AppLocalizations.of(context)!;

    if (value == null || value.isEmpty) {
      return localization.confirmPasswordEmpty;
    }
    if (value != originalPassword) {
      return localization.passwordsDoNotMatch;
    }
    return null;
  }
}