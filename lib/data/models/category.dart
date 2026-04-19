import 'package:flutter/material.dart';

class Category {
  String id;
  String nameEn;
  String nameAr;
  String imageDark;
  String imageLight;
  IconData icon;

  Category({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.imageDark,
    required this.imageLight,
    required this.icon,
  });
}

Map<String, Category> allCategories = {
      'book_club': Category(
        id: 'book_club',
        nameEn: 'Book Club',
        nameAr: 'نادي الكتاب',
        imageDark: 'assets/images/dark_images/book_club.png',
        imageLight: 'assets/images/light_images/book_club.png',
        icon: Icons.menu_book,
      ),
      'sport': Category(
        id: 'sport',
        nameEn: 'Sport',
        nameAr: 'رياضة',
        imageDark: 'assets/images/dark_images/sport.png',
        imageLight: 'assets/images/light_images/sport.png',
        icon: Icons.directions_bike,
      ),
      'birthday': Category(
        id: 'birthday',
        nameEn: 'Birthday',
        nameAr: 'عيد ميلاد',
        imageDark: 'assets/images/dark_images/birthday.png',
        imageLight: 'assets/images/light_images/birthday.png',
        icon: Icons.cake,
      ),
      'exhibition': Category(
        id: 'exhibition',
        nameEn: 'Exhibition',
        nameAr: 'معرض',
        imageDark: 'assets/images/dark_images/exhibition.png',
        imageLight: 'assets/images/light_images/exhibition.png',
        icon: Icons.camera_alt,
      ),
      'meeting': Category(
        id: 'meeting',
        nameEn: 'Meeting',
        nameAr: 'اجتماع',
        imageDark: 'assets/images/dark_images/meeting.png',
        imageLight: 'assets/images/light_images/meeting.png',
        icon: Icons.group,
      ),
    };
