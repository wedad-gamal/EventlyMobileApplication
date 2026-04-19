import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String formatDate (){
    return DateFormat("dd-MM-yyyy").format(this);
  }
}

extension Spacing on num{
  SizedBox get verticalSpace => SizedBox(height: toDouble(),);
  SizedBox get horizontalSpace => SizedBox(width: toDouble(),);
}

extension StringWidget on String {
  Text toBodyText(BuildContext context) => Text(
        this,
        style: Theme.of(context).textTheme.bodyLarge,
      );
}