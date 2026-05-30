import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_measurement.freezed.dart';
part 'body_measurement.g.dart';

@freezed
class BodyMeasurement with _$BodyMeasurement {
  const factory BodyMeasurement({
    required String id,
    required String userId,
    required DateTime date,
    required double weightKg,
    double? bodyFatPercent,
    double? leanBodyMassKg,
    double? muscleMassKg,
    double? waistCm,
    double? chestCm,
    double? armCm,
    double? legCm,
    String? notes,
  }) = _BodyMeasurement;

  factory BodyMeasurement.fromJson(Map<String, dynamic> json) =>
      _$BodyMeasurementFromJson(json);
}
