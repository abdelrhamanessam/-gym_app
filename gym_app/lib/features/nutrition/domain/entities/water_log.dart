import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_log.freezed.dart';
part 'water_log.g.dart';

@freezed
class WaterLog with _$WaterLog {
  const factory WaterLog({
    required String id,
    required String userId,
    required DateTime date,
    @Default(250) double amountMl,
    required DateTime createdAt,
  }) = _WaterLog;

  factory WaterLog.fromJson(Map<String, dynamic> json) =>
      _$WaterLogFromJson(json);
}
