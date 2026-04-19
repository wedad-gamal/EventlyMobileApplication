import 'package:flutter/material.dart';

class AppDialog {
  static void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text(message),
          ],
        ),
      ),
    );
  }

  static void showDialogMessage(
    BuildContext context,
    String message, {
    bool barrierDismissible= false,
    String? postActionText,
    Function? onPositiveAction,
    String? negativeActionText,
    Function? onNegativeAction

  }) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        content: SingleChildScrollView(child: Text(message)),
        actions: [
          if (negativeActionText != null)
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onNegativeAction?.call();
              },
              child: Text(negativeActionText),
            ),
          if (postActionText != null)
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                onPositiveAction?.call();
              },
              child: Text(postActionText),
            ),
        ],
      ),
    );
  }
}
