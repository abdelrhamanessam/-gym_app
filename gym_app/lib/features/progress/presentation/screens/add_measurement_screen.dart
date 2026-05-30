import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import '../../domain/entities/body_measurement.dart';
import '../providers/progress_providers.dart';

class AddMeasurementScreen extends ConsumerStatefulWidget {
  const AddMeasurementScreen({super.key});

  @override
  ConsumerState<AddMeasurementScreen> createState() =>
      _AddMeasurementScreenState();
}

class _AddMeasurementScreenState extends ConsumerState<AddMeasurementScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  final _weightCtrl = TextEditingController();
  final _bodyFatCtrl = TextEditingController();
  final _leanMassCtrl = TextEditingController();
  final _muscleMassCtrl = TextEditingController();
  final _waistCtrl = TextEditingController();
  final _chestCtrl = TextEditingController();
  final _armCtrl = TextEditingController();
  final _legCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  bool _isSaving = false;

  @override
  void dispose() {
    _weightCtrl.dispose();
    _bodyFatCtrl.dispose();
    _leanMassCtrl.dispose();
    _muscleMassCtrl.dispose();
    _waistCtrl.dispose();
    _chestCtrl.dispose();
    _armCtrl.dispose();
    _legCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: AppColors.primary,
            surface: AppColors.surface,
            onSurface: AppColors.textPrimary,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final weight = double.tryParse(_weightCtrl.text);
    if (weight == null) return;

    setState(() => _isSaving = true);

    final measurement = BodyMeasurement(
      id: const Uuid().v4(),
      userId: '',
      date: _selectedDate,
      weightKg: weight,
      bodyFatPercent: double.tryParse(_bodyFatCtrl.text),
      leanBodyMassKg: double.tryParse(_leanMassCtrl.text),
      muscleMassKg: double.tryParse(_muscleMassCtrl.text),
      waistCm: double.tryParse(_waistCtrl.text),
      chestCm: double.tryParse(_chestCtrl.text),
      armCm: double.tryParse(_armCtrl.text),
      legCm: double.tryParse(_legCtrl.text),
      notes: _notesCtrl.text.isNotEmpty ? _notesCtrl.text : null,
    );

    await ref.read(addMeasurementProvider(measurement).future);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Log Measurement'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            InkWell(
              onTap: _pickDate,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded,
                        color: AppColors.primary),
                    const SizedBox(width: 12),
                    Text(
                      DateFormat('MMMM d, yyyy').format(_selectedDate),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right_rounded,
                        color: AppColors.textHint),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildField('Weight (kg)', _weightCtrl, required: true),
            const SizedBox(height: 14),
            _buildField('Body Fat %', _bodyFatCtrl),
            const SizedBox(height: 14),
            _buildField('Lean Body Mass (kg)', _leanMassCtrl),
            const SizedBox(height: 14),
            _buildField('Muscle Mass (kg)', _muscleMassCtrl),
            const SizedBox(height: 14),
            const Divider(color: AppColors.divider),
            const SizedBox(height: 14),
            _buildField('Waist (cm)', _waistCtrl),
            const SizedBox(height: 14),
            _buildField('Chest (cm)', _chestCtrl),
            const SizedBox(height: 14),
            _buildField('Arm (cm)', _armCtrl),
            const SizedBox(height: 14),
            _buildField('Leg (cm)', _legCtrl),
            const SizedBox(height: 14),
            const Divider(color: AppColors.divider),
            const SizedBox(height: 14),
            TextFormField(
              controller: _notesCtrl,
              style: const TextStyle(
                  color: AppColors.textPrimary, fontFamily: 'Poppins'),
              decoration: const InputDecoration(
                labelText: 'Notes (optional)',
                hintText: 'Feeling, energy level, etc.',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _save,
                child: _isSaving
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: AppColors.textOnPrimary),
                      )
                    : const Text('Save Measurement'),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller,
      {bool required = false}) {
    return TextFormField(
      controller: controller,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true),
      style: const TextStyle(
          color: AppColors.textPrimary, fontFamily: 'Poppins'),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontFamily: 'Poppins'),
      ),
      validator: required
          ? (v) {
              if (v == null || v.trim().isEmpty) return 'Required';
              if (double.tryParse(v.trim()) == null) return 'Invalid number';
              return null;
            }
          : null,
    );
  }
}
