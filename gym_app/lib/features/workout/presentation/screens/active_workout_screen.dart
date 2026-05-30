import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_set.dart';
import '../../domain/entities/workout_set_group.dart';
import '../../domain/repositories/workout_repository.dart';
import '../providers/workout_providers.dart';
import '../widgets/rest_timer.dart';
import '../widgets/set_input_row.dart';
import '../widgets/workout_summary_card.dart';
import 'package:uuid/uuid.dart';

class ActiveWorkoutScreen extends ConsumerStatefulWidget {
  const ActiveWorkoutScreen({super.key});

  @override
  ConsumerState<ActiveWorkoutScreen> createState() =>
      _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends ConsumerState<ActiveWorkoutScreen> {
  int _currentExerciseIndex = 0;
  final _weightController = TextEditingController();
  final _repsController = TextEditingController();
  double _rpe = 7;
  DateTime? _startTime;
  Timer? _timer;
  int _elapsedSeconds = 0;
  bool _isFinished = false;
  final _restTimerKey = GlobalKey<RestTimerState>();

  List<WorkoutSetGroup> get _exercises => [];

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_startTime != null) {
        setState(() {
          _elapsedSeconds = DateTime.now().difference(_startTime!).inSeconds;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  void _addSet() {
    final weight = double.tryParse(_weightController.text);
    final reps = int.tryParse(_repsController.text);
    if (weight == null || reps == null || weight <= 0 || reps <= 0) return;

    ref.read(activeWorkoutProvider.notifier).addSet(
          _currentExercise.exerciseId,
          WorkoutSet(
            setNumber: _currentExercise.sets.length + 1,
            reps: reps,
            weightKg: weight,
            rpe: _rpe.round(),
          ),
        );
    _weightController.clear();
    _repsController.clear();
    _rpe = 7;
    _restTimerKey.currentState?.start();
  }

  WorkoutSetGroup get _currentExercise {
    final state = ref.read(activeWorkoutProvider);
    final session = state.valueOrNull;
    if (session == null || session.exercises.isEmpty) {
      return WorkoutSetGroup(
        exerciseId: '',
        exerciseName: 'No Exercise',
        sets: [],
      );
    }
    return session.exercises[_currentExerciseIndex];
  }

  void _nextExercise() {
    if (_currentExerciseIndex <
        (ref.read(activeWorkoutProvider).valueOrNull?.exercises.length ?? 1) -
            1) {
      setState(() => _currentExerciseIndex++);
    }
  }

  void _previousExercise() {
    if (_currentExerciseIndex > 0) {
      setState(() => _currentExerciseIndex--);
    }
  }

  void _finishWorkout() {
    ref.read(activeWorkoutProvider.notifier).updateDuration(
          _elapsedSeconds ~/ 60,
        );
    ref.read(activeWorkoutProvider.notifier).completeWorkout();
    setState(() => _isFinished = true);
  }

  void _saveAndExit() {
    final session = ref.read(activeWorkoutProvider).valueOrNull;
    if (session != null) {
      ref.read(workoutRepositoryProvider).saveWorkoutSession(session);
    }
    ref.read(activeWorkoutProvider.notifier).reset();
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final activeWorkout = ref.watch(activeWorkoutProvider);

    return activeWorkout.when(
      data: (session) {
        if (session == null) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(title: const Text('No Active Workout')),
            body: const Center(child: Text('Start a workout first!')),
          );
        }
        if (_isFinished) {
          return _buildSummary(session);
        }
        return _buildActiveWorkout(session);
      },
      loading: () => const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _buildActiveWorkout(session) {
    final elapsed = Duration(seconds: _elapsedSeconds);
    final hours = elapsed.inHours;
    final minutes = elapsed.inMinutes.remainder(60);
    final secs = _elapsedSeconds.remainder(60);
    final timeStr =
        '${hours > 0 ? '${hours.toString().padLeft(2, '0')}:' : ''}${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(session.name),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  timeStr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ExerciseHeader(
                    exercise: _currentExercise,
                    currentIndex: _currentExerciseIndex,
                    totalExercises: session.exercises.length,
                  ),
                  const SizedBox(height: 16),
                  if (_currentExercise.sets.isNotEmpty) ...[
                    const Text(
                      'Completed Sets',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    ..._currentExercise.sets.map(
                      (set) => _CompletedSetRow(set: set),
                    ),
                    const SizedBox(height: 16),
                  ],
                  RestTimer(key: _restTimerKey),
                  const SizedBox(height: 16),
                  const Text(
                    'Add Set',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  SetInputRow(
                    setNumber: _currentExercise.sets.length + 1,
                    weightController: _weightController,
                    repsController: _repsController,
                    rpe: _rpe,
                    onRpeChanged: (v) => setState(() => _rpe = v),
                    onComplete: _addSet,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border(
                top: BorderSide(
                  color: AppColors.border.withOpacity(0.3),
                ),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  if (_currentExerciseIndex > 0)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _previousExercise,
                        icon: const Icon(Icons.chevron_left_rounded),
                        label: const Text('Previous'),
                      ),
                    ),
                  if (_currentExerciseIndex > 0) const SizedBox(width: 12),
                  Expanded(
                    child: _currentExerciseIndex <
                            session.exercises.length - 1
                        ? ElevatedButton.icon(
                            onPressed: _nextExercise,
                            icon: const Icon(Icons.chevron_right_rounded),
                            label: const Text('Next'),
                          )
                        : ElevatedButton.icon(
                            onPressed: _finishWorkout,
                            icon: const Icon(Icons.flag_rounded),
                            label: const Text('Finish Workout'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondary,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(session) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Workout Summary'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: _saveAndExit,
            icon: const Icon(Icons.close_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            WorkoutSummaryCard(session: session),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _saveAndExit,
                icon: const Icon(Icons.save_rounded),
                label: const Text('Save Workout'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _saveAndExit,
                icon: const Icon(Icons.share_rounded),
                label: const Text('Share'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseHeader extends StatelessWidget {
  final WorkoutSetGroup exercise;
  final int currentIndex;
  final int totalExercises;

  const _ExerciseHeader({
    required this.exercise,
    required this.currentIndex,
    required this.totalExercises,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Exercise ${currentIndex + 1}/$totalExercises',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          exercise.exerciseName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

class _CompletedSetRow extends StatelessWidget {
  final WorkoutSet set;

  const _CompletedSetRow({required this.set});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${set.setNumber}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${set.weightKg.toStringAsFixed(1)} kg × ${set.reps}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontFamily: 'Poppins',
            ),
          ),
          const Spacer(),
          if (set.rpe != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'RPE ${set.rpe}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.warning,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          if (set.isWarmup)
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'Warmup',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.info,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
        ],
      ),
    );
  }
}
