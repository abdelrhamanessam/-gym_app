import '../../domain/entities/body_goal.dart';
import '../../domain/entities/body_measurement.dart';
import '../../domain/entities/progress_photo.dart';
import '../../domain/repositories/progress_repository.dart';
import '../datasources/progress_remote_datasource.dart';
import '../models/body_goal_model.dart';
import '../models/body_measurement_model.dart';
import '../models/progress_photo_model.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final ProgressRemoteDataSource _dataSource;

  ProgressRepositoryImpl(this._dataSource);

  @override
  Future<List<BodyMeasurement>> getMeasurements(String userId,
      {int? limit}) async {
    final models =
        await _dataSource.getMeasurements(userId, limit: limit);
    return models.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> addMeasurement(BodyMeasurement measurement) async {
    final model = BodyMeasurementModel.fromDomain(measurement);
    await _dataSource.addMeasurement(model);
  }

  @override
  Future<BodyMeasurement?> getLatestMeasurement(String userId) async {
    final model = await _dataSource.getLatestMeasurement(userId);
    return model?.toDomain();
  }

  @override
  Future<List<BodyGoal>> getBodyGoals(String userId) async {
    final models = await _dataSource.getBodyGoals(userId);
    return models.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> saveBodyGoal(BodyGoal goal) async {
    final model = BodyGoalModel.fromDomain(goal);
    await _dataSource.saveBodyGoal(model);
  }

  @override
  Future<List<ProgressPhoto>> getProgressPhotos(String userId) async {
    final models = await _dataSource.getProgressPhotos(userId);
    return models.map((m) => m.toDomain()).toList();
  }

  @override
  Future<void> addProgressPhoto(ProgressPhoto photo) async {
    final model = ProgressPhotoModel.fromDomain(photo);
    await _dataSource.addProgressPhoto(model);
  }

  @override
  Future<void> deleteProgressPhoto(String id) async {
    await _dataSource.deleteProgressPhoto(id);
  }
}

@riverpod
ProgressRepository progressRepository(ProgressRepositoryRef ref) {
  final dataSource = ref.watch(progressRemoteDataSourceProvider);
  return ProgressRepositoryImpl(dataSource);
}
