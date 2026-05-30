import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/progress_remote_datasource.dart';
import '../../data/repositories/progress_repository_impl.dart';
import '../../domain/entities/body_goal.dart';
import '../../domain/entities/body_measurement.dart';
import '../../domain/entities/progress_photo.dart';
import '../../domain/repositories/progress_repository.dart';

part 'progress_providers.g.dart';

@riverpod
ProgressRepository progressRepository(ProgressRepositoryRef ref) {
  final dataSource = ref.watch(progressRemoteDataSourceProvider);
  return ProgressRepositoryImpl(dataSource);
}

@riverpod
Future<List<BodyMeasurement>> measurementsProvider(
    MeasurementsProviderRef ref) async {
  final repo = ref.watch(progressRepositoryProvider);
  return repo.getMeasurements('');
}

@riverpod
Future<BodyMeasurement?> latestMeasurementProvider(
    LatestMeasurementProviderRef ref) async {
  final repo = ref.watch(progressRepositoryProvider);
  return repo.getLatestMeasurement('');
}

@riverpod
Future<List<BodyGoal>> bodyGoalsProvider(BodyGoalsProviderRef ref) async {
  final repo = ref.watch(progressRepositoryProvider);
  return repo.getBodyGoals('');
}

@riverpod
Future<List<ProgressPhoto>> progressPhotosProvider(
    ProgressPhotosProviderRef ref) async {
  final repo = ref.watch(progressRepositoryProvider);
  return repo.getProgressPhotos('');
}

@riverpod
Future<void> addMeasurementProvider(
    AddMeasurementProviderRef ref, BodyMeasurement measurement) async {
  final repo = ref.watch(progressRepositoryProvider);
  await repo.addMeasurement(measurement);
  ref.invalidate(measurementsProvider);
  ref.invalidate(latestMeasurementProvider);
}

@riverpod
Future<void> saveBodyGoalProvider(
    SaveBodyGoalProviderRef ref, BodyGoal goal) async {
  final repo = ref.watch(progressRepositoryProvider);
  await repo.saveBodyGoal(goal);
  ref.invalidate(bodyGoalsProvider);
}
