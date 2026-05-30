import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../data/datasources/workout_remote_datasource.dart';
import '../../data/repositories/workout_repository_impl.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_set.dart';
import '../../domain/entities/workout_set_group.dart';
import '../../domain/entities/workout_session.dart';
import '../../domain/entities/workout_template.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/entities/workout_history.dart';
import '../../domain/repositories/workout_repository.dart';

part 'workout_providers.g.dart';

@riverpod
WorkoutRepository workoutRepository(WorkoutRepositoryRef ref) {
  final dataSource = ref.watch(workoutRemoteDataSourceProvider);
  return WorkoutRepositoryImpl(dataSource);
}

@riverpod
Future<List<Exercise>> exercisesProvider(
  ExercisesProviderRef ref, {
  MuscleGroup? muscleGroup,
}) async {
  final repo = ref.watch(workoutRepositoryProvider);
  return repo.getExercises(muscleGroup: muscleGroup);
}

@riverpod
Future<Exercise?> exerciseDetailProvider(
  ExerciseDetailProviderRef ref,
  String id,
) async {
  final repo = ref.watch(workoutRepositoryProvider);
  return repo.getExerciseById(id);
}

@riverpod
Future<List<WorkoutSession>> workoutSessionsProvider(
  WorkoutSessionsProviderRef ref, {
  DateTime? date,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final repo = ref.watch(workoutRepositoryProvider);
  return repo.getWorkoutSessions(
    '',
    date: date,
    startDate: startDate,
    endDate: endDate,
  );
}

@riverpod
Future<List<WorkoutTemplate>> workoutTemplatesProvider(
  WorkoutTemplatesProviderRef ref,
) async {
  final repo = ref.watch(workoutRepositoryProvider);
  return repo.getWorkoutTemplates('');
}

@riverpod
Future<List<WorkoutProgram>> workoutProgramsProvider(
  WorkoutProgramsProviderRef ref,
) async {
  final repo = ref.watch(workoutRepositoryProvider);
  return repo.getBuiltInPrograms();
}

@riverpod
class ActiveWorkout extends _$ActiveWorkout {
  @override
  AsyncValue<WorkoutSession?> build() => const AsyncData(null);

  void startWorkout(String name, List<WorkoutSetGroup> exercises) {
    state = AsyncData(WorkoutSession(
      id: const Uuid().v4(),
      userId: '',
      date: DateTime.now(),
      name: name,
      exercises: exercises,
      createdAt: DateTime.now(),
    ));
  }

  void addSet(String exerciseId, WorkoutSet set) {
    state.whenData((session) {
      if (session == null) return;
      final updatedExercises = session.exercises.map((group) {
        if (group.exerciseId != exerciseId) return group;
        return group.copyWith(sets: [...group.sets, set]);
      }).toList();
      final updatedSession = session.copyWith(exercises: updatedExercises);
      state = AsyncData(updatedSession);
    });
  }

  void removeSet(String exerciseId, int setNumber) {
    state.whenData((session) {
      if (session == null) return;
      final updatedExercises = session.exercises.map((group) {
        if (group.exerciseId != exerciseId) return group;
        return group.copyWith(
          sets: group.sets.where((s) => s.setNumber != setNumber).toList(),
        );
      }).toList();
      final updatedSession = session.copyWith(exercises: updatedExercises);
      state = AsyncData(updatedSession);
    });
  }

  void updateDuration(int minutes) {
    state.whenData((session) {
      if (session == null) return;
      state = AsyncData(session.copyWith(durationMinutes: minutes));
    });
  }

  void updateNotes(String notes) {
    state.whenData((session) {
      if (session == null) return;
      state = AsyncData(session.copyWith(notes: notes));
    });
  }

  void completeWorkout() {
    state.whenData((session) {
      if (session == null) return;
      double totalVolume = 0;
      for (final group in session.exercises) {
        for (final set in group.sets) {
          totalVolume += set.weightKg * set.reps;
        }
      }
      state = AsyncData(session.copyWith(
        isCompleted: true,
        totalVolumeKg: totalVolume,
      ));
    });
  }

  void reset() {
    state = const AsyncData(null);
  }
}

@riverpod
Future<void> saveWorkoutSessionProvider(
  SaveWorkoutSessionProviderRef ref,
  WorkoutSession session,
) async {
  final repo = ref.watch(workoutRepositoryProvider);
  await repo.saveWorkoutSession(session);
}

@riverpod
Future<List<WorkoutHistory>> workoutHistoryProvider(
  WorkoutHistoryProviderRef ref,
) async {
  final repo = ref.watch(workoutRepositoryProvider);
  return repo.getWorkoutHistory('');
}
