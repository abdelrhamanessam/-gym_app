// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_advice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiAdvice _$AiAdviceFromJson(Map<String, dynamic> json) {
  return _AiAdvice.fromJson(json);
}

/// @nodoc
mixin _$AiAdvice {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  AdviceType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<String> get actionItems => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AiAdvice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiAdvice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiAdviceCopyWith<AiAdvice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiAdviceCopyWith<$Res> {
  factory $AiAdviceCopyWith(AiAdvice value, $Res Function(AiAdvice) then) =
      _$AiAdviceCopyWithImpl<$Res, AiAdvice>;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      AdviceType type,
      String title,
      String message,
      List<String> actionItems,
      DateTime createdAt});
}

/// @nodoc
class _$AiAdviceCopyWithImpl<$Res, $Val extends AiAdvice>
    implements $AiAdviceCopyWith<$Res> {
  _$AiAdviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiAdvice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? actionItems = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AdviceType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      actionItems: null == actionItems
          ? _value.actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiAdviceImplCopyWith<$Res>
    implements $AiAdviceCopyWith<$Res> {
  factory _$$AiAdviceImplCopyWith(
          _$AiAdviceImpl value, $Res Function(_$AiAdviceImpl) then) =
      __$$AiAdviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      AdviceType type,
      String title,
      String message,
      List<String> actionItems,
      DateTime createdAt});
}

/// @nodoc
class __$$AiAdviceImplCopyWithImpl<$Res>
    extends _$AiAdviceCopyWithImpl<$Res, _$AiAdviceImpl>
    implements _$$AiAdviceImplCopyWith<$Res> {
  __$$AiAdviceImplCopyWithImpl(
      _$AiAdviceImpl _value, $Res Function(_$AiAdviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiAdvice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? actionItems = null,
    Object? createdAt = null,
  }) {
    return _then(_$AiAdviceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AdviceType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      actionItems: null == actionItems
          ? _value._actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiAdviceImpl implements _AiAdvice {
  const _$AiAdviceImpl(
      {required this.id,
      required this.userId,
      required this.date,
      required this.type,
      required this.title,
      required this.message,
      final List<String> actionItems = const [],
      required this.createdAt})
      : _actionItems = actionItems;

  factory _$AiAdviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiAdviceImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime date;
  @override
  final AdviceType type;
  @override
  final String title;
  @override
  final String message;
  final List<String> _actionItems;
  @override
  @JsonKey()
  List<String> get actionItems {
    if (_actionItems is EqualUnmodifiableListView) return _actionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionItems);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'AiAdvice(id: $id, userId: $userId, date: $date, type: $type, title: $title, message: $message, actionItems: $actionItems, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiAdviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._actionItems, _actionItems) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, date, type, title,
      message, const DeepCollectionEquality().hash(_actionItems), createdAt);

  /// Create a copy of AiAdvice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiAdviceImplCopyWith<_$AiAdviceImpl> get copyWith =>
      __$$AiAdviceImplCopyWithImpl<_$AiAdviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiAdviceImplToJson(
      this,
    );
  }
}

abstract class _AiAdvice implements AiAdvice {
  const factory _AiAdvice(
      {required final String id,
      required final String userId,
      required final DateTime date,
      required final AdviceType type,
      required final String title,
      required final String message,
      final List<String> actionItems,
      required final DateTime createdAt}) = _$AiAdviceImpl;

  factory _AiAdvice.fromJson(Map<String, dynamic> json) =
      _$AiAdviceImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get date;
  @override
  AdviceType get type;
  @override
  String get title;
  @override
  String get message;
  @override
  List<String> get actionItems;
  @override
  DateTime get createdAt;

  /// Create a copy of AiAdvice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiAdviceImplCopyWith<_$AiAdviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailySummaryReport _$DailySummaryReportFromJson(Map<String, dynamic> json) {
  return _DailySummaryReport.fromJson(json);
}

/// @nodoc
mixin _$DailySummaryReport {
  DateTime get date => throw _privateConstructorUsedError;
  int get caloriesConsumed => throw _privateConstructorUsedError;
  int get caloriesTarget => throw _privateConstructorUsedError;
  int get proteinConsumed => throw _privateConstructorUsedError;
  int get proteinTarget => throw _privateConstructorUsedError;
  int get carbsConsumed => throw _privateConstructorUsedError;
  int get carbsTarget => throw _privateConstructorUsedError;
  int get fatConsumed => throw _privateConstructorUsedError;
  int get fatTarget => throw _privateConstructorUsedError;
  int get waterMl => throw _privateConstructorUsedError;
  int get waterTargetMl => throw _privateConstructorUsedError;
  bool get workoutCompleted => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  String get aiAdvice => throw _privateConstructorUsedError;

  /// Serializes this DailySummaryReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailySummaryReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySummaryReportCopyWith<DailySummaryReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySummaryReportCopyWith<$Res> {
  factory $DailySummaryReportCopyWith(
          DailySummaryReport value, $Res Function(DailySummaryReport) then) =
      _$DailySummaryReportCopyWithImpl<$Res, DailySummaryReport>;
  @useResult
  $Res call(
      {DateTime date,
      int caloriesConsumed,
      int caloriesTarget,
      int proteinConsumed,
      int proteinTarget,
      int carbsConsumed,
      int carbsTarget,
      int fatConsumed,
      int fatTarget,
      int waterMl,
      int waterTargetMl,
      bool workoutCompleted,
      int streakDays,
      String aiAdvice});
}

/// @nodoc
class _$DailySummaryReportCopyWithImpl<$Res, $Val extends DailySummaryReport>
    implements $DailySummaryReportCopyWith<$Res> {
  _$DailySummaryReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailySummaryReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? caloriesConsumed = null,
    Object? caloriesTarget = null,
    Object? proteinConsumed = null,
    Object? proteinTarget = null,
    Object? carbsConsumed = null,
    Object? carbsTarget = null,
    Object? fatConsumed = null,
    Object? fatTarget = null,
    Object? waterMl = null,
    Object? waterTargetMl = null,
    Object? workoutCompleted = null,
    Object? streakDays = null,
    Object? aiAdvice = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      caloriesConsumed: null == caloriesConsumed
          ? _value.caloriesConsumed
          : caloriesConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesTarget: null == caloriesTarget
          ? _value.caloriesTarget
          : caloriesTarget // ignore: cast_nullable_to_non_nullable
              as int,
      proteinConsumed: null == proteinConsumed
          ? _value.proteinConsumed
          : proteinConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      proteinTarget: null == proteinTarget
          ? _value.proteinTarget
          : proteinTarget // ignore: cast_nullable_to_non_nullable
              as int,
      carbsConsumed: null == carbsConsumed
          ? _value.carbsConsumed
          : carbsConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      carbsTarget: null == carbsTarget
          ? _value.carbsTarget
          : carbsTarget // ignore: cast_nullable_to_non_nullable
              as int,
      fatConsumed: null == fatConsumed
          ? _value.fatConsumed
          : fatConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      fatTarget: null == fatTarget
          ? _value.fatTarget
          : fatTarget // ignore: cast_nullable_to_non_nullable
              as int,
      waterMl: null == waterMl
          ? _value.waterMl
          : waterMl // ignore: cast_nullable_to_non_nullable
              as int,
      waterTargetMl: null == waterTargetMl
          ? _value.waterTargetMl
          : waterTargetMl // ignore: cast_nullable_to_non_nullable
              as int,
      workoutCompleted: null == workoutCompleted
          ? _value.workoutCompleted
          : workoutCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      aiAdvice: null == aiAdvice
          ? _value.aiAdvice
          : aiAdvice // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailySummaryReportImplCopyWith<$Res>
    implements $DailySummaryReportCopyWith<$Res> {
  factory _$$DailySummaryReportImplCopyWith(_$DailySummaryReportImpl value,
          $Res Function(_$DailySummaryReportImpl) then) =
      __$$DailySummaryReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int caloriesConsumed,
      int caloriesTarget,
      int proteinConsumed,
      int proteinTarget,
      int carbsConsumed,
      int carbsTarget,
      int fatConsumed,
      int fatTarget,
      int waterMl,
      int waterTargetMl,
      bool workoutCompleted,
      int streakDays,
      String aiAdvice});
}

/// @nodoc
class __$$DailySummaryReportImplCopyWithImpl<$Res>
    extends _$DailySummaryReportCopyWithImpl<$Res, _$DailySummaryReportImpl>
    implements _$$DailySummaryReportImplCopyWith<$Res> {
  __$$DailySummaryReportImplCopyWithImpl(_$DailySummaryReportImpl _value,
      $Res Function(_$DailySummaryReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailySummaryReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? caloriesConsumed = null,
    Object? caloriesTarget = null,
    Object? proteinConsumed = null,
    Object? proteinTarget = null,
    Object? carbsConsumed = null,
    Object? carbsTarget = null,
    Object? fatConsumed = null,
    Object? fatTarget = null,
    Object? waterMl = null,
    Object? waterTargetMl = null,
    Object? workoutCompleted = null,
    Object? streakDays = null,
    Object? aiAdvice = null,
  }) {
    return _then(_$DailySummaryReportImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      caloriesConsumed: null == caloriesConsumed
          ? _value.caloriesConsumed
          : caloriesConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      caloriesTarget: null == caloriesTarget
          ? _value.caloriesTarget
          : caloriesTarget // ignore: cast_nullable_to_non_nullable
              as int,
      proteinConsumed: null == proteinConsumed
          ? _value.proteinConsumed
          : proteinConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      proteinTarget: null == proteinTarget
          ? _value.proteinTarget
          : proteinTarget // ignore: cast_nullable_to_non_nullable
              as int,
      carbsConsumed: null == carbsConsumed
          ? _value.carbsConsumed
          : carbsConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      carbsTarget: null == carbsTarget
          ? _value.carbsTarget
          : carbsTarget // ignore: cast_nullable_to_non_nullable
              as int,
      fatConsumed: null == fatConsumed
          ? _value.fatConsumed
          : fatConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      fatTarget: null == fatTarget
          ? _value.fatTarget
          : fatTarget // ignore: cast_nullable_to_non_nullable
              as int,
      waterMl: null == waterMl
          ? _value.waterMl
          : waterMl // ignore: cast_nullable_to_non_nullable
              as int,
      waterTargetMl: null == waterTargetMl
          ? _value.waterTargetMl
          : waterTargetMl // ignore: cast_nullable_to_non_nullable
              as int,
      workoutCompleted: null == workoutCompleted
          ? _value.workoutCompleted
          : workoutCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      aiAdvice: null == aiAdvice
          ? _value.aiAdvice
          : aiAdvice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailySummaryReportImpl implements _DailySummaryReport {
  const _$DailySummaryReportImpl(
      {required this.date,
      this.caloriesConsumed = 0,
      this.caloriesTarget = 0,
      this.proteinConsumed = 0,
      this.proteinTarget = 0,
      this.carbsConsumed = 0,
      this.carbsTarget = 0,
      this.fatConsumed = 0,
      this.fatTarget = 0,
      this.waterMl = 0,
      this.waterTargetMl = 0,
      this.workoutCompleted = false,
      this.streakDays = 0,
      required this.aiAdvice});

  factory _$DailySummaryReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailySummaryReportImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final int caloriesConsumed;
  @override
  @JsonKey()
  final int caloriesTarget;
  @override
  @JsonKey()
  final int proteinConsumed;
  @override
  @JsonKey()
  final int proteinTarget;
  @override
  @JsonKey()
  final int carbsConsumed;
  @override
  @JsonKey()
  final int carbsTarget;
  @override
  @JsonKey()
  final int fatConsumed;
  @override
  @JsonKey()
  final int fatTarget;
  @override
  @JsonKey()
  final int waterMl;
  @override
  @JsonKey()
  final int waterTargetMl;
  @override
  @JsonKey()
  final bool workoutCompleted;
  @override
  @JsonKey()
  final int streakDays;
  @override
  final String aiAdvice;

  @override
  String toString() {
    return 'DailySummaryReport(date: $date, caloriesConsumed: $caloriesConsumed, caloriesTarget: $caloriesTarget, proteinConsumed: $proteinConsumed, proteinTarget: $proteinTarget, carbsConsumed: $carbsConsumed, carbsTarget: $carbsTarget, fatConsumed: $fatConsumed, fatTarget: $fatTarget, waterMl: $waterMl, waterTargetMl: $waterTargetMl, workoutCompleted: $workoutCompleted, streakDays: $streakDays, aiAdvice: $aiAdvice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySummaryReportImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.caloriesConsumed, caloriesConsumed) ||
                other.caloriesConsumed == caloriesConsumed) &&
            (identical(other.caloriesTarget, caloriesTarget) ||
                other.caloriesTarget == caloriesTarget) &&
            (identical(other.proteinConsumed, proteinConsumed) ||
                other.proteinConsumed == proteinConsumed) &&
            (identical(other.proteinTarget, proteinTarget) ||
                other.proteinTarget == proteinTarget) &&
            (identical(other.carbsConsumed, carbsConsumed) ||
                other.carbsConsumed == carbsConsumed) &&
            (identical(other.carbsTarget, carbsTarget) ||
                other.carbsTarget == carbsTarget) &&
            (identical(other.fatConsumed, fatConsumed) ||
                other.fatConsumed == fatConsumed) &&
            (identical(other.fatTarget, fatTarget) ||
                other.fatTarget == fatTarget) &&
            (identical(other.waterMl, waterMl) || other.waterMl == waterMl) &&
            (identical(other.waterTargetMl, waterTargetMl) ||
                other.waterTargetMl == waterTargetMl) &&
            (identical(other.workoutCompleted, workoutCompleted) ||
                other.workoutCompleted == workoutCompleted) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.aiAdvice, aiAdvice) ||
                other.aiAdvice == aiAdvice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      caloriesConsumed,
      caloriesTarget,
      proteinConsumed,
      proteinTarget,
      carbsConsumed,
      carbsTarget,
      fatConsumed,
      fatTarget,
      waterMl,
      waterTargetMl,
      workoutCompleted,
      streakDays,
      aiAdvice);

  /// Create a copy of DailySummaryReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySummaryReportImplCopyWith<_$DailySummaryReportImpl> get copyWith =>
      __$$DailySummaryReportImplCopyWithImpl<_$DailySummaryReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailySummaryReportImplToJson(
      this,
    );
  }
}

abstract class _DailySummaryReport implements DailySummaryReport {
  const factory _DailySummaryReport(
      {required final DateTime date,
      final int caloriesConsumed,
      final int caloriesTarget,
      final int proteinConsumed,
      final int proteinTarget,
      final int carbsConsumed,
      final int carbsTarget,
      final int fatConsumed,
      final int fatTarget,
      final int waterMl,
      final int waterTargetMl,
      final bool workoutCompleted,
      final int streakDays,
      required final String aiAdvice}) = _$DailySummaryReportImpl;

  factory _DailySummaryReport.fromJson(Map<String, dynamic> json) =
      _$DailySummaryReportImpl.fromJson;

  @override
  DateTime get date;
  @override
  int get caloriesConsumed;
  @override
  int get caloriesTarget;
  @override
  int get proteinConsumed;
  @override
  int get proteinTarget;
  @override
  int get carbsConsumed;
  @override
  int get carbsTarget;
  @override
  int get fatConsumed;
  @override
  int get fatTarget;
  @override
  int get waterMl;
  @override
  int get waterTargetMl;
  @override
  bool get workoutCompleted;
  @override
  int get streakDays;
  @override
  String get aiAdvice;

  /// Create a copy of DailySummaryReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySummaryReportImplCopyWith<_$DailySummaryReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
