import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/body_measurement.dart';

part 'body_measurement_model.freezed.dart';
part 'body_measurement_model.g.dart';

@freezed
class BodyMeasurementModel with _$BodyMeasurementModel {
  const factory BodyMeasurementModel({
    required String id,
    required String userId,
    required String date,
    required double weightKg,
    double? bodyFatPercent,
    double? leanBodyMassKg,
    double? muscleMassKg,
    double? waistCm,
    double? chestCm,
    double? armCm,
    double? legCm,
    String? notes,
  }) = _BodyMeasurementModel;

  factory BodyMeasurementModel.fromJson(Map<String, dynamic> json) =>
      _$BodyMeasurementModelFromJson(json);

  factory BodyMeasurementModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BodyMeasurementModel.fromJson({...data, 'id': doc.id});
  }

  factory BodyMeasurementModel.fromDomain(BodyMeasurement m) =>
      BodyMeasurementModel(
        id: m.id,
        userId: m.userId,
        date: m.date.toIso8601String(),
        weightKg: m.weightKg,
        bodyFatPercent: m.bodyFatPercent,
        leanBodyMassKg: m.leanBodyMassKg,
        muscleMassKg: m.muscleMassKg,
        waistCm: m.waistCm,
        chestCm: m.chestCm,
        armCm: m.armCm,
        legCm: m.legCm,
        notes: m.notes,
      );
}

extension BodyMeasurementModelX on BodyMeasurementModel {
  Map<String, dynamic> toFirestore() => toJson()..remove('id');

  BodyMeasurement toDomain() => BodyMeasurement(
        id: id,
        userId: userId,
        date: DateTime.parse(date),
        weightKg: weightKg,
        bodyFatPercent: bodyFatPercent,
        leanBodyMassKg: leanBodyMassKg,
        muscleMassKg: muscleMassKg,
        waistCm: waistCm,
        chestCm: chestCm,
        armCm: armCm,
        legCm: legCm,
        notes: notes,
      );
}
