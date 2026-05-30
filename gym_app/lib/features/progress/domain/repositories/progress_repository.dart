import '../entities/body_goal.dart';
import '../entities/body_measurement.dart';
import '../entities/progress_photo.dart';

abstract class ProgressRepository {
  Future<List<BodyMeasurement>> getMeasurements(String userId, {int? limit});
  Future<void> addMeasurement(BodyMeasurement measurement);
  Future<BodyMeasurement?> getLatestMeasurement(String userId);
  Future<List<BodyGoal>> getBodyGoals(String userId);
  Future<void> saveBodyGoal(BodyGoal goal);
  Future<List<ProgressPhoto>> getProgressPhotos(String userId);
  Future<void> addProgressPhoto(ProgressPhoto photo);
  Future<void> deleteProgressPhoto(String id);
}
