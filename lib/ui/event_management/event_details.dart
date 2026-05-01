import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/utilites/appDialog.dart';
import 'package:evently_app/data/firebase/firebase_event_database.dart';
import 'package:evently_app/data/models/category.dart';
import 'package:evently_app/data/models/event.dart';
import 'package:evently_app/ui/event_management/event_management_screen.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatelessWidget {
  static const String routeName = "/event-details";
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as Event;
    final category = allCategories[event.categoryId]!;
    final provider = Provider.of<AppConfigProvider>(context);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.eventDetailsTitle),
        leading: CustomBackButton(
          onPress: () => Navigator.pop(context),
        ),
        leadingWidth: 80,
        actions: [
          // Edit button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                EventManagementScreen.routeName,
                arguments: event,
              );
            },
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.onSecondary,
              foregroundColor: theme.colorScheme.primary,
              side: BorderSide(
                width: 1,
                color: theme.colorScheme.primary,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
            icon: Icon(Icons.edit_outlined, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 8),
          // Delete button
          IconButton(
            onPressed: () => _confirmDelete(context, event, l10n),
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.error.withAlpha(20),
              foregroundColor: theme.colorScheme.error,
              side: BorderSide(
                width: 1,
                color: theme.colorScheme.error,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
            icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Category Cover Image ──────────────────────────────────────
            _buildCoverImage(context, category, provider),

            // ── Event Title ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                event.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ── Date & Time ───────────────────────────────────────────────
            _buildDateTimeCard(context, event, theme),

            const SizedBox(height: 20),

            // ── Description ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.eventDetailsDescription,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withAlpha(15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  event.description,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.secondary,
                    height: 1.6,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverImage(
    BuildContext context,
    Category category,
    AppConfigProvider provider,
  ) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(16),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.secondary.withAlpha(10),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(
            provider.isDark ? category.imageDark : category.imageLight,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildDateTimeCard(
    BuildContext context,
    Event event,
    ThemeData theme,
  ) {
    final dateStr = DateFormat("dd MMMM").format(event.date);
    final timeStr = DateFormat("hh:mm a").format(event.time);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withAlpha(15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withAlpha(30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.calendar_month_outlined,
                color: theme.colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dateStr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  timeStr,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.secondary.withAlpha(150),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    Event event,
    AppLocalizations l10n,
  ) {
    AppDialog.showDialogMessage(
      context,
      l10n.eventDetailsDeleteConfirmation,
      postActionText: l10n.eventDetailsCancel,
      negativeActionText: l10n.eventDetailsDelete,
      onNegativeAction: () async {
        final database = FirebaseEventDatabase();
        await database.deleteEvent(event.id);
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              content: Text(l10n.eventDetailsDeletedSuccess),
            ),
          );
        }
      },
    );
  }
}
