import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import '../providers/admin_providers.dart';

class AdminNotificationsScreen extends ConsumerStatefulWidget {
  const AdminNotificationsScreen({super.key});

  @override
  ConsumerState<AdminNotificationsScreen> createState() =>
      _AdminNotificationsScreenState();
}

class _AdminNotificationsScreenState
    extends ConsumerState<AdminNotificationsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedTarget = 'all';
  bool _scheduleLater = false;
  DateTime? _scheduledDate;
  TimeOfDay? _scheduledTime;

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              surface: AppColors.surface,
            ),
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      setState(() => _scheduledDate = date);
    }
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              surface: AppColors.surface,
            ),
          ),
          child: child!,
        );
      },
    );
    if (time != null) {
      setState(() => _scheduledTime = time);
    }
  }

  Future<void> _sendNotification() async {
    if (!_formKey.currentState!.validate()) return;

    DateTime? scheduledAt;
    if (_scheduleLater && _scheduledDate != null && _scheduledTime != null) {
      scheduledAt = DateTime(
        _scheduledDate!.year,
        _scheduledDate!.month,
        _scheduledDate!.day,
        _scheduledTime!.hour,
        _scheduledTime!.minute,
      );
    }

    await ref.read(adminNotificationsProvider.notifier).sendNotification(
          title: _titleController.text.trim(),
          message: _messageController.text.trim(),
          target: _selectedTarget,
          scheduledAt: scheduledAt,
        );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Notification sent'),
          backgroundColor: AppColors.success,
        ),
      );
      _titleController.clear();
      _messageController.clear();
      setState(() {
        _scheduleLater = false;
        _scheduledDate = null;
        _scheduledTime = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Notification'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
                decoration: InputDecoration(
                  labelText: 'Notification Title',
                  labelStyle: const TextStyle(
                    color: AppColors.textSecondary,
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _messageController,
                maxLines: 5,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
                decoration: InputDecoration(
                  labelText: 'Message',
                  labelStyle: const TextStyle(
                    color: AppColors.textSecondary,
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  alignLabelWithHint: true,
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 20),
              const Text(
                'Target Audience',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  _targetChip('All Users', 'all'),
                  _targetChip('Active Users', 'active'),
                  _targetChip('Inactive Users', 'inactive'),
                  _targetChip('Premium', 'premium'),
                ],
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text(
                  'Schedule for later',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                value: _scheduleLater,
                onChanged: (v) => setState(() => _scheduleLater = v),
                activeColor: AppColors.primary,
                contentPadding: EdgeInsets.zero,
              ),
              if (_scheduleLater) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _pickDate,
                        icon: const Icon(Icons.calendar_today_rounded, size: 18),
                        label: Text(
                          _scheduledDate != null
                              ? '${_scheduledDate!.month}/${_scheduledDate!.day}'
                              : 'Pick Date',
                          style: const TextStyle(fontFamily: 'Poppins'),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.textPrimary,
                          side: const BorderSide(color: AppColors.border),
                          backgroundColor: AppColors.surface,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _pickTime,
                        icon: const Icon(Icons.access_time_rounded, size: 18),
                        label: Text(
                          _scheduledTime != null
                              ? _scheduledTime!.format(context)
                              : 'Pick Time',
                          style: const TextStyle(fontFamily: 'Poppins'),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.textPrimary,
                          side: const BorderSide(color: AppColors.border),
                          backgroundColor: AppColors.surface,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _sendNotification,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text('Send Notification'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _targetChip(String label, String value) {
    final isSelected = _selectedTarget == value;
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: isSelected ? AppColors.primary : AppColors.textSecondary,
          fontFamily: 'Poppins',
        ),
      ),
      selected: isSelected,
      onSelected: (_) => setState(() => _selectedTarget = value),
      selectedColor: AppColors.primary.withOpacity(0.15),
      backgroundColor: AppColors.surfaceLight,
      side: BorderSide(
        color: isSelected ? AppColors.primary : AppColors.border,
      ),
    );
  }
}
