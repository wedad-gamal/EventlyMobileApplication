import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CategoryTabs extends StatelessWidget {
  final List<Category> categories;
  final Category selectedCategory;
  final Function(int) tabOnPress;

  const CategoryTabs({
    super.key,
    required this.categories,
    required this.tabOnPress,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);

    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category.id == selectedCategory.id;

          return GestureDetector(
            onTap: () => tabOnPress(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondary,
                border: Border.all(
                  width: 1,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary.withAlpha(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    category.icon,
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    provider.isEnglish ? category.nameEn : category.nameAr,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: isSelected
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}