import 'package:evently_app/core/provider/app_config_provider.dart';
import 'package:evently_app/data/models/category.dart';
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

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    for (var category in allCategories) {
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
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme,
          ),
          child: child!,
        );
      },
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
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  void _submitEvent() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please choose a date')),
        );
        return;
      }
      if (_selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please choose a time')),
        );
        return;
      }
      // TODO: Submit event to Firebase or backend
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event added successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
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
              _buildCategoriesTabBar(context),
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
            'Title',
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
                return 'Please enter an event title';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Event Title',
            ),
          ),
          SizedBox(height: 20),

          // Description Field
          Text(
            'Description',
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
                return 'Please enter a description';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Event Description...',
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
            label: 'Event Date',
            valueText:
            _selectedDate != null ? _formatDate(_selectedDate!) : null,
            placeholder: 'Choose date',
            onTap: _pickDate,
          ),
          _buildDateTimeTile(
            context,
            icon: Icons.access_time_outlined,
            label: 'Event Time',
            valueText:
            _selectedTime != null ? _formatTime(_selectedTime!) : null,
            placeholder: 'Choose time',
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
        SizedBox(width: 12),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text( valueText ?? placeholder),
        ),
      ],
    );
  }

  /// ── Add Event Button ───────────────────────────────────────────────────────
  Widget _buildAddEventButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FilledButton(
        style: FilledButton.styleFrom(
          minimumSize: Size(double.infinity, 0)
        ),
        onPressed: _submitEvent,
        child: Text(
          'Add event',
        ),
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

  /// ── Categories Tab Bar ─────────────────────────────────────────────────────
  DefaultTabController _buildCategoriesTabBar(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return DefaultTabController(
      length: categories.length,
      child: TabBar(
        onTap: (index) {
          setState(() {
            selectedCategory = categories[index];
          });
        },
        labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        isScrollable: true,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        tabs: categories
            .map(
              (category) => Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(16),
              color: category.id == selectedCategory.id
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSecondary,
              border: Border.all(
                width: 1,
                color: category.id == selectedCategory.id
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context)
                    .colorScheme
                    .secondary
                    .withAlpha(20),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  category.icon,
                  color: category.id == selectedCategory.id
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 8),
                Text(
                  provider.isEnglish
                      ? category.nameEn
                      : category.nameAr,
                  style:
                  Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: selectedCategory.id == category.id
                        ? Theme.of(context)
                        .colorScheme
                        .onPrimary
                        : Theme.of(context)
                        .colorScheme
                        .secondary,
                  ),
                ),
              ],
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}