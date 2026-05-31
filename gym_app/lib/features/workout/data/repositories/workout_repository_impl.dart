import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_history.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/entities/workout_session.dart';
import '../../domain/entities/workout_set_group.dart';
import '../../domain/entities/workout_template.dart';
import '../../domain/repositories/workout_repository.dart';
import '../datasources/workout_remote_datasource.dart';
import '../models/workout_history_model.dart';
import '../models/workout_program_model.dart';
import '../models/workout_session_model.dart';
import '../models/exercise_model.dart';
import '../models/workout_template_model.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  final WorkoutRemoteDataSource _dataSource;

  WorkoutRepositoryImpl(this._dataSource);

  @override
  Future<List<Exercise>> getExercises({MuscleGroup? muscleGroup}) async {
    final models = await _dataSource.getExercises(muscleGroup: muscleGroup);
    return models.map((m) => m.toDomain()).toList();
  }

  @override
  Future<Exercise?> getExerciseById(String id) async {
    final model = await _dataSource.getExerciseById(id);
    return model?.toDomain();
  }

  @override
  Future<void> saveWorkoutSession(WorkoutSession session) async {
    final model = WorkoutSessionModel.fromDomain(session);
    await _dataSource.saveWorkoutSession(model);
    for (final group in session.exercises) {
      final history = WorkoutHistory(
        id: '${session.id}_${group.exerciseId}',
        workoutSessionId: session.id,
        date: session.date,
        exerciseName: group.exerciseName,
        muscleGroup: MuscleGroup.values.firstWhere(
          (m) => m.name == group.exerciseId.split('_').first,
          orElse: () => MuscleGroup.chest,
        ),
        sets: group.sets,
        volumeKg: group.sets.fold<double>(
            0, (sum, s) => sum + (s.weightKg * s.reps)),
        createdAt: DateTime.now(),
      );
      final historyModel = WorkoutHistoryModel.fromDomain(history);
      await _dataSource.saveWorkoutSession(model);
    }
  }

  @override
  Future<List<WorkoutSession>> getWorkoutSessions(
    String userId, {
    DateTime? date,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final models = await _dataSource.getWorkoutSessions(
      userId,
      date: date,
      startDate: startDate,
      endDate: endDate,
    );
    return models.map((m) => m.toDomain()).toList();
  }

  @override
  Future<WorkoutSession?> getWorkoutSessionById(String id) async {
    final model = await _dataSource.getWorkoutSessionById(id);
    return model?.toDomain();
  }

  @override
  Future<void> deleteWorkoutSession(String id) async {
    await _dataSource.deleteWorkoutSession(id);
  }

  @override
  Future<void> saveWorkoutTemplate(WorkoutTemplate template) async {
    final model = WorkoutTemplateModel.fromDomain(template);
    await _dataSource.saveWorkoutTemplate(model);
  }

  @override
  Future<List<WorkoutTemplate>> getWorkoutTemplates(String userId) async {
    final models = await _dataSource.getWorkoutTemplates(userId);
    return models.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> deleteWorkoutTemplate(String id) async {
    await _dataSource.deleteWorkoutTemplate(id);
  }

  @override
  Future<List<WorkoutProgram>> getBuiltInPrograms() async {
    final models = await _dataSource.getBuiltInPrograms();
    return models.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> saveCustomProgram(WorkoutProgram program) async {
    final model = WorkoutProgramModel.fromDomain(program);
    await _dataSource.saveCustomProgram(model);
  }

  @override
  Future<List<WorkoutHistory>> getWorkoutHistory(
    String userId, {
    MuscleGroup? muscleGroup,
    int? limit,
  }) async {
    final models = await _dataSource.getWorkoutHistory(
      userId,
      muscleGroup: muscleGroup,
      limit: limit,
    );
    return models.map((m) => m.toDomain()).toList();
  }
}

// Provider moved to workout_providers.dart
