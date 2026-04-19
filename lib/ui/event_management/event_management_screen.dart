import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/l10n/app_localizations.dart';
import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/core/utilites/appDialog.dart';
import 'package:evently_app/core/utilites/extension.dart';
import 'package:evently_app/data/firebase/firebase_event_database.dart';
import 'package:evently_app/data/models/category.dart';
import 'package:evently_app/data/models/event.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/home/widgets/category_tabs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:evently_app/ui/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventManagementScreen extends StatefulWidget {
  static const String routeName = "/event_management";
  const EventManagementScreen({super.key});

  @override
  State<EventManagementScreen> createState() => _EventManagementScreenState();
}

class _EventManagementScreenState extends State<EventManagementScreen> {
  late Category selectedCategory;
  List<Category> categories = [];
  AppLocalizations get l10n => AppLocalizations.of(context)!;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    for (final category in allCategories.values) {
      categories.add(category);
    }
    selectedCategory = categories.first;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365 * 2)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(colorScheme: Theme.of(context).colorScheme),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am
        ? l10n.eventManagementTimeAm
        : l10n.eventManagementTimePm;
    return '$hour:$minute $period';
  }

  void _submitEvent() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.eventManagementPleaseChooseDate)),
        );
        return;
      }
      if (_selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.eventManagementPleaseChooseTime)),
        );
        return;
      }

      final eventTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );

      final event = Event(
        id: '',
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        date: _selectedDate!,
        time: eventTime,
        categoryId: selectedCategory.id,
        userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      );

      createEvent(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.eventManagementAddEventTitle),
        leading: CustomBackButton(),
        leadingWidth: 80,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryCoverImage(context),
              CategoryTabs(
                categories: categories,
                tabOnPress: (index) {
                  setState(() {
                    selectedCategory = categories[index];
                  });
                },
                selectedCategory: selectedCategory,
              ),
              SizedBox(height: 24),
              _buildFormSection(context),
              _buildDateTimeSection(context),
              _buildAddEventButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// ── Form Fields: Title & Description ──────────────────────────────────────
  Widget _buildFormSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Field
          Text(
            l10n.eventManagementTitleLabel,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _titleController,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return l10n.eventManagementTitleRequired;
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: l10n.eventManagementTitleHint,
            ),
          ),
          SizedBox(height: 20),

          // Description Field
          Text(
            l10n.eventManagementDescriptionLabel,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _descriptionController,
            maxLines: 4,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return l10n.eventManagementDescriptionRequired;
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: l10n.eventManagementDescriptionHint,
            ),
          ),
        ],
      ),
    );
  }

  /// ── Date & Time Row ────────────────────────────────────────────────────────
  Widget _buildDateTimeSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildDateTimeTile(
            context,
            icon: Icons.calendar_month_outlined,
            label: l10n.eventManagementEventDate,
            valueText: _selectedDate?.formatDate(),
            placeholder: l10n.eventManagementChooseDate,
            onTap: _pickDate,
          ),
          _buildDateTimeTile(
            context,
            icon: Icons.access_time_outlined,
            label: l10n.eventManagementEventTime,
            valueText: _selectedTime != null
                ? _formatTime(_selectedTime!)
                : null,
            placeholder: l10n.eventManagementChooseTime,
            onTap: _pickTime,
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String? valueText,
    required String placeholder,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 22,
          color: Theme.of(context).colorScheme.secondary.withAlpha(99),
        ),
        12.horizontalSpace,
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        TextButton(onPressed: onTap, child: Text(valueText ?? placeholder)),
      ],
    );
  }

  /// ── Add Event Button ───────────────────────────────────────────────────────
  Widget _buildAddEventButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FilledButton(
        style: FilledButton.styleFrom(minimumSize: Size(double.infinity, 0)),
        onPressed: _submitEvent,
        child: Text(l10n.eventManagementAddEventButton),
      ),
    );
  }

  /// ── Category Cover Image ───────────────────────────────────────────────────
  Container _buildCategoryCoverImage(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(16),
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
            provider.isDark
                ? selectedCategory.imageDark
                : selectedCategory.imageLight,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Future<void> createEvent(Event event) async {
    AppDialog.showLoadingDialog(context, "Loading...");
    try {
      final firebaseEventDatabase = FirebaseEventDatabase();
      await firebaseEventDatabase.addEvent(event);
      if (mounted) {
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            content: Text(l10n.eventManagementEventAddedSuccess),
          ),
        );
      }
    } catch (e) {
      print("Failed to create event: $e");
      AppDialog.showDialogMessage(
        context,
        "An error has occured - ${e.toString()}",
        negativeActionText: "ok",
      );
    }
  }
}
