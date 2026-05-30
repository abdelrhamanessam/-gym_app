import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/workout_set.dart';

part 'workout_set_model.freezed.dart';
part 'workout_set_model.g.dart';

@freezed
class WorkoutSetModel with _$WorkoutSetModel {
  const factory WorkoutSetModel({
    required int setNumber,
    required int reps,
    required double weightKg,
    @Default(false) bool isWarmup,
    @Default(false) bool isDropset,
    int? rpe,
    String? notes,
  }) = _WorkoutSetModel;

  factory WorkoutSetModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSetModelFromJson(json);

  factory WorkoutSetModel.fromDomain(WorkoutSet set) => WorkoutSetModel(
        setNumber: set.setNumber,
        reps: set.reps,
        weightKg: set.weightKg,
        isWarmup: set.isWarmup,
        isDropset: set.isDropset,
        rpe: set.rpe,
        notes: set.notes,
      );

  WorkoutSet toDomain() => WorkoutSet(
        setNumber: setNumber,
        reps: reps,
        weightKg: weightKg,
        isWarmup: isWarmup,
        isDropset: isDropset,
        rpe: rpe,
        notes: notes,
      );
}
