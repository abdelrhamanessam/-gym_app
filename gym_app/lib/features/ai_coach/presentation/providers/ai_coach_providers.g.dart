// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_coach_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dailyAiAdviceHash() => r'bbefd88c33ee3c1ed00c7bcae8c312868aef49f2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DailyAiAdvice
    extends BuildlessAutoDisposeAsyncNotifier<entities.AiAdvice?> {
  late final String userId;
  late final DateTime date;

  FutureOr<entities.AiAdvice?> build(
    String userId,
    DateTime date,
  );
}

/// See also [DailyAiAdvice].
@ProviderFor(DailyAiAdvice)
const dailyAiAdviceProvider = DailyAiAdviceFamily();

/// See also [DailyAiAdvice].
class DailyAiAdviceFamily extends Family<AsyncValue<entities.AiAdvice?>> {
  /// See also [DailyAiAdvice].
  const DailyAiAdviceFamily();

  /// See also [DailyAiAdvice].
  DailyAiAdviceProvider call(
    String userId,
    DateTime date,
  ) {
    return DailyAiAdviceProvider(
      userId,
      date,
    );
  }

  @override
  DailyAiAdviceProvider getProviderOverride(
    covariant DailyAiAdviceProvider provider,
  ) {
    return call(
      provider.userId,
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dailyAiAdviceProvider';
}

/// See also [DailyAiAdvice].
class DailyAiAdviceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DailyAiAdvice, entities.AiAdvice?> {
  /// See also [DailyAiAdvice].
  DailyAiAdviceProvider(
    String userId,
    DateTime date,
  ) : this._internal(
          () => DailyAiAdvice()
            ..userId = userId
            ..date = date,
          from: dailyAiAdviceProvider,
          name: r'dailyAiAdviceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dailyAiAdviceHash,
          dependencies: DailyAiAdviceFamily._dependencies,
          allTransitiveDependencies:
              DailyAiAdviceFamily._allTransitiveDependencies,
          userId: userId,
          date: date,
        );

  DailyAiAdviceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.date,
  }) : super.internal();

  final String userId;
  final DateTime date;

  @override
  FutureOr<entities.AiAdvice?> runNotifierBuild(
    covariant DailyAiAdvice notifier,
  ) {
    return notifier.build(
      userId,
      date,
    );
  }

  @override
  Override overrideWith(DailyAiAdvice Function() create) {
    return ProviderOverride(
      origin: this,
      override: DailyAiAdviceProvider._internal(
        () => create()
          ..userId = userId
          ..date = date,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DailyAiAdvice, entities.AiAdvice?>
      createElement() {
    return _DailyAiAdviceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailyAiAdviceProvider &&
        other.userId == userId &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DailyAiAdviceRef
    on AutoDisposeAsyncNotifierProviderRef<entities.AiAdvice?> {
  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `date` of this provider.
  DateTime get date;
}

class _DailyAiAdviceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DailyAiAdvice,
        entities.AiAdvice?> with DailyAiAdviceRef {
  _DailyAiAdviceProviderElement(super.provider);

  @override
  String get userId => (origin as DailyAiAdviceProvider).userId;
  @override
  DateTime get date => (origin as DailyAiAdviceProvider).date;
}

String _$dailySummaryReportHash() =>
    r'47f64c25fb4759a1e249c421583fbb90ff64d2f1';

abstract class _$DailySummaryReport
    extends BuildlessAutoDisposeAsyncNotifier<entities.DailySummaryReport> {
  late final String userId;
  late final DateTime date;

  FutureOr<entities.DailySummaryReport> build(
    String userId,
    DateTime date,
  );
}

/// See also [DailySummaryReport].
@ProviderFor(DailySummaryReport)
const dailySummaryReportProvider = DailySummaryReportFamily();

/// See also [DailySummaryReport].
class DailySummaryReportFamily
    extends Family<AsyncValue<entities.DailySummaryReport>> {
  /// See also [DailySummaryReport].
  const DailySummaryReportFamily();

  /// See also [DailySummaryReport].
  DailySummaryReportProvider call(
    String userId,
    DateTime date,
  ) {
    return DailySummaryReportProvider(
      userId,
      date,
    );
  }

  @override
  DailySummaryReportProvider getProviderOverride(
    covariant DailySummaryReportProvider provider,
  ) {
    return call(
      provider.userId,
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dailySummaryReportProvider';
}

/// See also [DailySummaryReport].
class DailySummaryReportProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DailySummaryReport, entities.DailySummaryReport> {
  /// See also [DailySummaryReport].
  DailySummaryReportProvider(
    String userId,
    DateTime date,
  ) : this._internal(
          () => DailySummaryReport()
            ..userId = userId
            ..date = date,
          from: dailySummaryReportProvider,
          name: r'dailySummaryReportProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dailySummaryReportHash,
          dependencies: DailySummaryReportFamily._dependencies,
          allTransitiveDependencies:
              DailySummaryReportFamily._allTransitiveDependencies,
          userId: userId,
          date: date,
        );

  DailySummaryReportProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.date,
  }) : super.internal();

  final String userId;
  final DateTime date;

  @override
  FutureOr<entities.DailySummaryReport> runNotifierBuild(
    covariant DailySummaryReport notifier,
  ) {
    return notifier.build(
      userId,
      date,
    );
  }

  @override
  Override overrideWith(DailySummaryReport Function() create) {
    return ProviderOverride(
      origin: this,
      override: DailySummaryReportProvider._internal(
        () => create()
          ..userId = userId
          ..date = date,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DailySummaryReport,
      entities.DailySummaryReport> createElement() {
    return _DailySummaryReportProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailySummaryReportProvider &&
        other.userId == userId &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DailySummaryReportRef
    on AutoDisposeAsyncNotifierProviderRef<entities.DailySummaryReport> {
  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `date` of this provider.
  DateTime get date;
}

class _DailySummaryReportProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DailySummaryReport,
        entities.DailySummaryReport> with DailySummaryReportRef {
  _DailySummaryReportProviderElement(super.provider);

  @override
  String get userId => (origin as DailySummaryReportProvider).userId;
  @override
  DateTime get date => (origin as DailySummaryReportProvider).date;
}

String _$aiCoachMessageHash() => r'7d0d1084166041a5458ab6573c639609bc4bbb5d';

/// See also [AiCoachMessage].
@ProviderFor(AiCoachMessage)
final aiCoachMessageProvider = AutoDisposeNotifierProvider<AiCoachMessage,
    List<Map<String, dynamic>>>.internal(
  AiCoachMessage.new,
  name: r'aiCoachMessageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aiCoachMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AiCoachMessage = AutoDisposeNotifier<List<Map<String, dynamic>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
