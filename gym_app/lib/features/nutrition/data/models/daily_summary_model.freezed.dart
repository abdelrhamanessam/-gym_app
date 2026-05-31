// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailySummaryModel _$DailySummaryModelFromJson(Map<String, dynamic> json) {
  return _DailySummaryModel.fromJson(json);
}

/// @nodoc
mixin _$DailySummaryModel {
  String get summaryId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get date => throw _privateConstructorUsedError;
  double get totalCalories => throw _privateConstructorUsedError;
  double get totalProtein => throw _privateConstructorUsedError;
  double get totalCarbs => throw _privateConstructorUsedError;
  double get totalFat => throw _privateConstructorUsedError;
  double get totalWaterMl => throw _privateConstructorUsedError;
  bool get workoutCompleted => throw _privateConstructorUsedError;
  String? get aiReport => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DailySummaryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySummaryModelCopyWith<DailySummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySummaryModelCopyWith<$Res> {
  factory $DailySummaryModelCopyWith(
          DailySummaryModel value, $Res Function(DailySummaryModel) then) =
      _$DailySummaryModelCopyWithImpl<$Res, DailySummaryModel>;
  @useResult
  $Res call(
      {String summaryId,
      String userId,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp date,
      double totalCalories,
      double totalProtein,
      double totalCarbs,
      double totalFat,
      double totalWaterMl,
      bool workoutCompleted,
      String? aiReport,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp createdAt});
}

/// @nodoc
class _$DailySummaryModelCopyWithImpl<$Res, $Val extends DailySummaryModel>
    implements $DailySummaryModelCopyWith<$Res> {
  _$DailySummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summaryId = null,
    Object? userId = null,
    Object? date = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? totalWaterMl = null,
    Object? workoutCompleted = null,
    Object? aiReport = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      summaryId: null == summaryId
          ? _value.summaryId
          : summaryId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double,
      totalProtein: null == totalProtein
          ? _value.totalProtein
          : totalProtein // ignore: cast_nullable_to_non_nullable
              as double,
      totalCarbs: null == totalCarbs
          ? _value.totalCarbs
          : totalCarbs // ignore: cast_nullable_to_non_nullable
              as double,
      totalFat: null == totalFat
          ? _value.totalFat
          : totalFat // ignore: cast_nullable_to_non_nullable
              as double,
      totalWaterMl: null == totalWaterMl
          ? _value.totalWaterMl
          : totalWaterMl // ignore: cast_nullable_to_non_nullable
              as double,
      workoutCompleted: null == workoutCompleted
          ? _value.workoutCompleted
          : workoutCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      aiReport: freezed == aiReport
          ? _value.aiReport
          : aiReport // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailySummaryModelImplCopyWith<$Res>
    implements $DailySummaryModelCopyWith<$Res> {
  factory _$$DailySummaryModelImplCopyWith(_$DailySummaryModelImpl value,
          $Res Function(_$DailySummaryModelImpl) then) =
      __$$DailySummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String summaryId,
      String userId,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp date,
      double totalCalories,
      double totalProtein,
      double totalCarbs,
      double totalFat,
      double totalWaterMl,
      bool workoutCompleted,
      String? aiReport,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp createdAt});
}

/// @nodoc
class __$$DailySummaryModelImplCopyWithImpl<$Res>
    extends _$DailySummaryModelCopyWithImpl<$Res, _$DailySummaryModelImpl>
    implements _$$DailySummaryModelImplCopyWith<$Res> {
  __$$DailySummaryModelImplCopyWithImpl(_$DailySummaryModelImpl _value,
      $Res Function(_$DailySummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summaryId = null,
    Object? userId = null,
    Object? date = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? totalWaterMl = null,
    Object? workoutCompleted = null,
    Object? aiReport = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$DailySummaryModelImpl(
      summaryId: null == summaryId
          ? _value.summaryId
          : summaryId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double,
      totalProtein: null == totalProtein
          ? _value.totalProtein
          : totalProtein // ignore: cast_nullable_to_non_nullable
              as double,
      totalCarbs: null == totalCarbs
          ? _value.totalCarbs
          : totalCarbs // ignore: cast_nullable_to_non_nullable
              as double,
      totalFat: null == totalFat
          ? _value.totalFat
          : totalFat // ignore: cast_nullable_to_non_nullable
              as double,
      totalWaterMl: null == totalWaterMl
          ? _value.totalWaterMl
          : totalWaterMl // ignore: cast_nullable_to_non_nullable
              as double,
      workoutCompleted: null == workoutCompleted
          ? _value.workoutCompleted
          : workoutCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      aiReport: freezed == aiReport
          ? _value.aiReport
          : aiReport // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailySummaryModelImpl implements _DailySummaryModel {
  const _$DailySummaryModelImpl(
      {required this.summaryId,
      required this.userId,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required this.date,
      this.totalCalories = 0,
      this.totalProtein = 0,
      this.totalCarbs = 0,
      this.totalFat = 0,
      this.totalWaterMl = 0,
      this.workoutCompleted = false,
      this.aiReport,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required this.createdAt});

  factory _$DailySummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailySummaryModelImplFromJson(json);

  @override
  final String summaryId;
  @override
  final String userId;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final Timestamp date;
  @override
  @JsonKey()
  final double totalCalories;
  @override
  @JsonKey()
  final double totalProtein;
  @override
  @JsonKey()
  final double totalCarbs;
  @override
  @JsonKey()
  final double totalFat;
  @override
  @JsonKey()
  final double totalWaterMl;
  @override
  @JsonKey()
  final bool workoutCompleted;
  @override
  final String? aiReport;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final Timestamp createdAt;

  @override
  String toString() {
    return 'DailySummaryModel(summaryId: $summaryId, userId: $userId, date: $date, totalCalories: $totalCalories, totalProtein: $totalProtein, totalCarbs: $totalCarbs, totalFat: $totalFat, totalWaterMl: $totalWaterMl, workoutCompleted: $workoutCompleted, aiReport: $aiReport, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySummaryModelImpl &&
            (identical(other.summaryId, summaryId) ||
                other.summaryId == summaryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalCalories, totalCalories) ||
                other.totalCalories == totalCalories) &&
            (identical(other.totalProtein, totalProtein) ||
                other.totalProtein == totalProtein) &&
            (identical(other.totalCarbs, totalCarbs) ||
                other.totalCarbs == totalCarbs) &&
            (identical(other.totalFat, totalFat) ||
                other.totalFat == totalFat) &&
            (identical(other.totalWaterMl, totalWaterMl) ||
                other.totalWaterMl == totalWaterMl) &&
            (identical(other.workoutCompleted, workoutCompleted) ||
                other.workoutCompleted == workoutCompleted) &&
            (identical(other.aiReport, aiReport) ||
                other.aiReport == aiReport) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      summaryId,
      userId,
      date,
      totalCalories,
      totalProtein,
      totalCarbs,
      totalFat,
      totalWaterMl,
      workoutCompleted,
      aiReport,
      createdAt);

  /// Create a copy of DailySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySummaryModelImplCopyWith<_$DailySummaryModelImpl> get copyWith =>
      __$$DailySummaryModelImplCopyWithImpl<_$DailySummaryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailySummaryModelImplToJson(
      this,
    );
  }
}

abstract class _DailySummaryModel implements DailySummaryModel {
  const factory _DailySummaryModel(
      {required final String summaryId,
      required final String userId,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required final Timestamp date,
      final double totalCalories,
      final double totalProtein,
      final double totalCarbs,
      final double totalFat,
      final double totalWaterMl,
      final bool workoutCompleted,
      final String? aiReport,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required final Timestamp createdAt}) = _$DailySummaryModelImpl;

  factory _DailySummaryModel.fromJson(Map<String, dynamic> json) =
      _$DailySummaryModelImpl.fromJson;

  @override
  String get summaryId;
  @override
  String get userId;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get date;
  @override
  double get totalCalories;
  @override
  double get totalProtein;
  @override
  double get totalCarbs;
  @override
  double get totalFat;
  @override
  double get totalWaterMl;
  @override
  bool get workoutCompleted;
  @override
  String? get aiReport;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get createdAt;

  /// Create a copy of DailySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySummaryModelImplCopyWith<_$DailySummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
