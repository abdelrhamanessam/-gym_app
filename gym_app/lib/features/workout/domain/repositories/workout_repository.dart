import '../entities/exercise.dart';
import '../entities/workout_history.dart';
import '../entities/workout_program.dart';
import '../entities/workout_session.dart';
import '../entities/workout_template.dart';

abstract class WorkoutRepository {
  Future<List<Exercise>> getExercises({MuscleGroup? muscleGroup});
  Future<Exercise?> getExerciseById(String id);
  Future<void> saveWorkoutSession(WorkoutSession session);
  Future<List<WorkoutSession>> getWorkoutSessions(
    String userId, {
    DateTime? date,
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<WorkoutSession?> getWorkoutSessionById(String id);
  Future<void> deleteWorkoutSession(String id);
  Future<void> saveWorkoutTemplate(WorkoutTemplate template);
  Future<List<WorkoutTemplate>> getWorkoutTemplates(String userId);
  Future<void> deleteWorkoutTemplate(String id);
  Future<List<WorkoutProgram>> getBuiltInPrograms();
  Future<void> saveCustomProgram(WorkoutProgram program);
  Future<List<WorkoutHistory>> getWorkoutHistory(
    String userId, {
    MuscleGroup? muscleGroup,
    int? limit,
  });
}
