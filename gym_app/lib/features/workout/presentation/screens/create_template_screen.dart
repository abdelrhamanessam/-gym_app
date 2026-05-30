import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/template_exercise.dart';
import '../../domain/entities/workout_template.dart';
import '../../domain/repositories/workout_repository.dart';
import '../providers/workout_providers.dart';

part 'create_template_screen.g.dart';

class CreateTemplateScreen extends ConsumerStatefulWidget {
  const CreateTemplateScreen({super.key});

  @override
  ConsumerState<CreateTemplateScreen> createState() =>
      _CreateTemplateScreenState();
}

class _CreateTemplateScreenState extends ConsumerState<CreateTemplateScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  Difficulty _difficulty = Difficulty.intermediate;
  Goal? _goal;
  int _estimatedDuration = 45;

  final _selectedExercises = <TemplateExercise>[];
  int _currentStep = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _addExercise() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => _ExercisePicker(
        onSelected: (exercise) {
          setState(() {
            _selectedExercises.add(TemplateExercise(
              exerciseId: exercise.id,
              exerciseName: exercise.name,
              order: _selectedExercises.length,
            ));
          });
          Navigator.pop(ctx);
        },
      ),
    );
  }

  void _removeExercise(int index) {
    setState(() {
      _selectedExercises.removeAt(index);
      for (var i = 0; i < _selectedExercises.length; i++) {
        _selectedExercises[i] =
            _selectedExercises[i].copyWith(order: i);
      }
    });
  }

  void _editExercise(int index) {
    final exercise = _selectedExercises[index];
    showDialog(
      context: context,
      builder: (ctx) => _ExerciseConfigDialog(
        initialSets: exercise.targetSets,
        initialReps: exercise.targetReps,
        initialRest: exercise.restSeconds,
        onSave: (sets, reps, rest) {
          setState(() {
            _selectedExercises[index] = exercise.copyWith(
              targetSets: sets,
              targetReps: reps,
              restSeconds: rest,
            );
          });
          Navigator.pop(ctx);
        },
      ),
    );
  }

  void _save() {
    if (_nameController.text.trim().isEmpty) return;
    if (_selectedExercises.isEmpty) return;

    final template = WorkoutTemplate(
      id: const Uuid().v4(),
      userId: '',
      name: _nameController.text.trim(),
      description: _descController.text.trim().isNotEmpty
          ? _descController.text.trim()
          : null,
      difficulty: _difficulty,
      goal: _goal,
      exercises: _selectedExercises,
      estimatedDuration: _estimatedDuration,
      createdAt: DateTime.now(),
    );

    ref.read(saveWorkoutTemplateProvider(template));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Create Template'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() => _currentStep++);
          } else {
            _save();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep--);
          } else {
            Navigator.pop(context);
          }
        },
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text(_currentStep == 2 ? 'Save' : 'Continue'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: details.onStepCancel,
                  child: Text(_currentStep == 0 ? 'Cancel' : 'Back'),
                ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('Basic Info',
                style: TextStyle(fontFamily: 'Poppins')),
            isActive: _currentStep >= 0,
            content: Column(
              children: [
                TextField(
                  controller: _nameController,
                  style: const TextStyle(
                      color: AppColors.textPrimary, fontFamily: 'Poppins'),
                  decoration: const InputDecoration(
                    labelText: 'Template Name',
                    hintText: 'e.g. Push Day',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _descController,
                  style: const TextStyle(
                      color: AppColors.textPrimary, fontFamily: 'Poppins'),
                  decoration: const InputDecoration(
                    labelText: 'Description (optional)',
                    hintText: 'e.g. Chest, shoulders, triceps',
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<Difficulty>(
                  value: _difficulty,
                  decoration: const InputDecoration(labelText: 'Difficulty'),
                  dropdownColor: AppColors.surface,
                  items: Difficulty.values
                      .map((d) => DropdownMenuItem(
                            value: d,
                            child: Text(d.name[0].toUpperCase() +
                                d.name.substring(1)),
                          ))
                      .toList(),
                  onChanged: (v) => setState(() => _difficulty = v!),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<Goal?>(
                  value: _goal,
                  decoration: const InputDecoration(labelText: 'Goal'),
                  dropdownColor: AppColors.surface,
                  items: [
                    const DropdownMenuItem(value: null, child: Text('None')),
                    ...Goal.values
                        .map((g) => DropdownMenuItem(
                              value: g,
                              child: Text(_goalName(g)),
                            ))
                        .toList(),
                  ],
                  onChanged: (v) => setState(() => _goal = v),
                ),
                const SizedBox(height: 16),
                TextField(
                  style: const TextStyle(
                      color: AppColors.textPrimary, fontFamily: 'Poppins'),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Estimated Duration (min)',
                    suffixText: 'min',
                  ),
                  controller: TextEditingController(
                      text: _estimatedDuration.toString()),
                  onChanged: (v) =>
                      _estimatedDuration = int.tryParse(v) ?? 45,
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Add Exercises',
                style: TextStyle(fontFamily: 'Poppins')),
            isActive: _currentStep >= 1,
            content: Column(
              children: [
                if (_selectedExercises.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: const Center(
                      child: Text(
                        'No exercises added yet',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ..._selectedExercises.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final exercise = entry.value;
                  return Dismissible(
                    key: Key(exercise.exerciseId),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.delete_rounded,
                          color: Colors.white),
                    ),
                    onDismissed: (_) => _removeExercise(idx),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: AppColors.border.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          ReorderableDragStartListener(
                            index: idx,
                            child: const Icon(
                              Icons.drag_handle_rounded,
                              color: AppColors.textHint,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exercise.exerciseName,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  '${exercise.targetSets}x${exercise.targetReps} \u2022 ${exercise.restSeconds}s rest',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.settings_rounded,
                                color: AppColors.textHint, size: 20),
                            onPressed: () => _editExercise(idx),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _addExercise,
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Add Exercise'),
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Review',
                style: TextStyle(fontFamily: 'Poppins')),
            isActive: _currentStep >= 2,
            content: Column(
              children: [
                _ReviewRow(label: 'Name', value: _nameController.text),
                if (_descController.text.isNotEmpty)
                  _ReviewRow(label: 'Description', value: _descController.text),
                _ReviewRow(
                    label: 'Difficulty',
                    value: _difficulty.name[0].toUpperCase() +
                        _difficulty.name.substring(1)),
                if (_goal != null)
                  _ReviewRow(label: 'Goal', value: _goalName(_goal!)),
                _ReviewRow(
                    label: 'Duration', value: '$_estimatedDuration min'),
                _ReviewRow(
                    label: 'Exercises',
                    value: '${_selectedExercises.length} exercises'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _goalName(Goal g) {
    switch (g) {
      case Goal.muscleGain:
        return 'Muscle Gain';
      case Goal.fatLoss:
        return 'Fat Loss';
      case Goal.strength:
        return 'Strength';
      case Goal.endurance:
        return 'Endurance';
    }
  }
}

class _ReviewRow extends StatelessWidget {
  final String label;
  final String value;

  const _ReviewRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExercisePicker extends ConsumerWidget {
  final ValueChanged<Exercise> onSelected;

  const _ExercisePicker({required this.onSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercisesAsync = ref.watch(exercisesProvider());

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      builder: (ctx, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.textHint,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Select Exercise',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: exercisesAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text(e.toString())),
                  data: (exercises) => ListView.builder(
                    controller: scrollController,
                    itemCount: exercises.length,
                    itemBuilder: (_, i) {
                      final exercise = exercises[i];
                      return ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.fitness_center_rounded,
                              color: AppColors.primary, size: 20),
                        ),
                        title: Text(
                          exercise.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        subtitle: Text(
                          exercise.muscleGroup.name[0].toUpperCase() +
                              exercise.muscleGroup.name.substring(1),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        onTap: () => onSelected(exercise),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ExerciseConfigDialog extends StatefulWidget {
  final int initialSets;
  final int initialReps;
  final int initialRest;
  final void Function(int sets, int reps, int rest) onSave;

  const _ExerciseConfigDialog({
    required this.initialSets,
    required this.initialReps,
    required this.initialRest,
    required this.onSave,
  });

  @override
  State<_ExerciseConfigDialog> createState() => _ExerciseConfigDialogState();
}

class _ExerciseConfigDialogState extends State<_ExerciseConfigDialog> {
  late TextEditingController _setsCtrl;
  late TextEditingController _repsCtrl;
  late TextEditingController _restCtrl;

  @override
  void initState() {
    super.initState();
    _setsCtrl = TextEditingController(text: widget.initialSets.toString());
    _repsCtrl = TextEditingController(text: widget.initialReps.toString());
    _restCtrl = TextEditingController(text: widget.initialRest.toString());
  }

  @override
  void dispose() {
    _setsCtrl.dispose();
    _repsCtrl.dispose();
    _restCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: const Text('Exercise Settings',
          style: TextStyle(fontFamily: 'Poppins')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _setsCtrl,
            keyboardType: TextInputType.number,
            style: const TextStyle(
                color: AppColors.textPrimary, fontFamily: 'Poppins'),
            decoration: const InputDecoration(labelText: 'Target Sets'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _repsCtrl,
            keyboardType: TextInputType.number,
            style: const TextStyle(
                color: AppColors.textPrimary, fontFamily: 'Poppins'),
            decoration: const InputDecoration(labelText: 'Target Reps'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _restCtrl,
            keyboardType: TextInputType.number,
            style: const TextStyle(
                color: AppColors.textPrimary, fontFamily: 'Poppins'),
            decoration: const InputDecoration(
              labelText: 'Rest (seconds)',
              suffixText: 'sec',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final sets = int.tryParse(_setsCtrl.text) ?? 3;
            final reps = int.tryParse(_repsCtrl.text) ?? 10;
            final rest = int.tryParse(_restCtrl.text) ?? 60;
            widget.onSave(sets, reps, rest);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

@riverpod
Future<void> saveWorkoutTemplateProvider(
    SaveWorkoutTemplateProviderRef ref, WorkoutTemplate template) async {
  final repo = ref.watch(workoutRepositoryProvider);
  await repo.saveWorkoutTemplate(template);
}
