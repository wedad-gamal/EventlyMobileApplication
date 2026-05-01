import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPress;
  const CustomBackButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: onPress,
        style: IconButton.styleFrom(
          padding: EdgeInsets.all(4),
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          foregroundColor: Theme.of(context).colorScheme.primary,
          side: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
