import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/widgets/loading_widget.dart';
import 'package:gym_app/core/widgets/error_widget.dart';
import '../../domain/entities/body_goal.dart';
import '../providers/progress_providers.dart';

class BodyGoalsScreen extends ConsumerWidget {
  const BodyGoalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(bodyGoalsProvider);
    final latestAsync = ref.watch(latestMeasurementProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Body Goals'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addGoal(context, ref),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Goal'),
      ),
      body: goalsAsync.when(
        loading: () => const LoadingScreen(),
        error: (e, _) =>
            AppErrorWidget(message: e.toString(), onRetry: () => ref.invalidate(bodyGoalsProvider)),
        data: (goals) {
          if (goals.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.textHint.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.flag_rounded,
                        color: AppColors.textHint, size: 40),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'No Goals Yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Set a fitness goal to track your progress!',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
            itemCount: goals.length,
            itemBuilder: (_, i) => _GoalCard(goal: goals[i]),
          );
        },
      ),
    );
  }

  void _addGoal(BuildContext context, WidgetRef ref) {
    final currentWeight = ref.read(latestMeasurementProvider).valueOrNull?.weightKg ?? 70.0;
    showDialog(
      context: context,
      builder: (ctx) => _AddGoalDialog(
        currentWeight: currentWeight,
        onSave: (goal) {
          ref.read(saveBodyGoalProvider(goal));
          Navigator.pop(ctx);
        },
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  final BodyGoal goal;

  const _GoalCard({required this.goal});

  @override
  Widget build(BuildContext context) {
    final progress = goal.targetWeightKg != null
        ? ((goal.startWeightKg - (goal.targetWeightKg! - goal.startWeightKg).abs()) /
                goal.startWeightKg)
            .clamp(0.0, 1.0)
        : 0.0;

    final targetDateStr = goal.targetDate != null
        ? 'Target: ${DateFormat('MMM d').format(goal.targetDate!)}'
        : 'No target date';

    final (label, color) = switch (goal.goal) {
      GoalType.fatLoss => ('Fat Loss', AppColors.warning),
      GoalType.muscleGain => ('Muscle Gain', AppColors.primary),
      GoalType.maintain => ('Maintain', AppColors.info),
    };

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.flag_rounded, color: color, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      targetDateStr,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (goal.targetWeightKg != null)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${goal.startWeightKg.toStringAsFixed(1)} kg',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '${goal.targetWeightKg!.toStringAsFixed(1)} kg',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: color,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppColors.surfaceLight,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 8,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${(progress * 100).toStringAsFixed(0)}% complete',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: color,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _AddGoalDialog extends StatefulWidget {
  final double currentWeight;
  final ValueChanged<BodyGoal> onSave;

  const _AddGoalDialog({
    required this.currentWeight,
    required this.onSave,
  });

  @override
  State<_AddGoalDialog> createState() => _AddGoalDialogState();
}

class _AddGoalDialogState extends State<_AddGoalDialog> {
  late TextEditingController _targetCtrl;
  GoalType _goalType = GoalType.fatLoss;
  DateTime? _targetDate;

  @override
  void initState() {
    super.initState();
    _targetCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _targetCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: const Text('Set Goal',
          style: TextStyle(fontFamily: 'Poppins')),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<GoalType>(
              value: _goalType,
              decoration: const InputDecoration(labelText: 'Goal Type'),
              dropdownColor: AppColors.surface,
              items: GoalType.values
                  .map((g) => DropdownMenuItem(
                        value: g,
                        child: Text(_goalName(g)),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _goalType = v!),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _targetCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(
                  color: AppColors.textPrimary, fontFamily: 'Poppins'),
              decoration: InputDecoration(
                labelText: 'Target Weight (kg)',
                hintText: 'Current: ${widget.currentWeight.toStringAsFixed(1)}',
              ),
            ),
            const SizedBox(height: 14),
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(const Duration(days: 90)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
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
                  setState(() => _targetDate = picked);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded,
                        color: AppColors.primary, size: 18),
                    const SizedBox(width: 10),
                    Text(
                      _targetDate != null
                          ? DateFormat('MMM d, yyyy').format(_targetDate!)
                          : 'Set target date (optional)',
                      style: TextStyle(
                        fontSize: 14,
                        color: _targetDate != null
                            ? AppColors.textPrimary
                            : AppColors.textHint,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final targetWeight = double.tryParse(_targetCtrl.text);
            if (targetWeight == null) return;
            widget.onSave(BodyGoal(
              id: const Uuid().v4(),
              userId: '',
              targetWeightKg: targetWeight,
              startWeightKg: widget.currentWeight,
              startDate: DateTime.now(),
              targetDate: _targetDate,
              goal: _goalType,
            ));
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  String _goalName(GoalType g) {
    switch (g) {
      case GoalType.fatLoss:
        return 'Fat Loss';
      case GoalType.muscleGain:
        return 'Muscle Gain';
      case GoalType.maintain:
        return 'Maintain';
    }
  }
}
