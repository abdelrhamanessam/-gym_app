// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weightChartDataHash() => r'd6c98812eabefc14e97b0b10ba4dc304af6f7166';

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

abstract class _$WeightChartData
    extends BuildlessAutoDisposeAsyncNotifier<List<FlSpot>> {
  late final ChartPeriod period;

  FutureOr<List<FlSpot>> build(
    ChartPeriod period,
  );
}

/// See also [WeightChartData].
@ProviderFor(WeightChartData)
const weightChartDataProvider = WeightChartDataFamily();

/// See also [WeightChartData].
class WeightChartDataFamily extends Family<AsyncValue<List<FlSpot>>> {
  /// See also [WeightChartData].
  const WeightChartDataFamily();

  /// See also [WeightChartData].
  WeightChartDataProvider call(
    ChartPeriod period,
  ) {
    return WeightChartDataProvider(
      period,
    );
  }

  @override
  WeightChartDataProvider getProviderOverride(
    covariant WeightChartDataProvider provider,
  ) {
    return call(
      provider.period,
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
  String? get name => r'weightChartDataProvider';
}

/// See also [WeightChartData].
class WeightChartDataProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WeightChartData, List<FlSpot>> {
  /// See also [WeightChartData].
  WeightChartDataProvider(
    ChartPeriod period,
  ) : this._internal(
          () => WeightChartData()..period = period,
          from: weightChartDataProvider,
          name: r'weightChartDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$weightChartDataHash,
          dependencies: WeightChartDataFamily._dependencies,
          allTransitiveDependencies:
              WeightChartDataFamily._allTransitiveDependencies,
          period: period,
        );

  WeightChartDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
  }) : super.internal();

  final ChartPeriod period;

  @override
  FutureOr<List<FlSpot>> runNotifierBuild(
    covariant WeightChartData notifier,
  ) {
    return notifier.build(
      period,
    );
  }

  @override
  Override overrideWith(WeightChartData Function() create) {
    return ProviderOverride(
      origin: this,
      override: WeightChartDataProvider._internal(
        () => create()..period = period,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WeightChartData, List<FlSpot>>
      createElement() {
    return _WeightChartDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeightChartDataProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WeightChartDataRef on AutoDisposeAsyncNotifierProviderRef<List<FlSpot>> {
  /// The parameter `period` of this provider.
  ChartPeriod get period;
}

class _WeightChartDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WeightChartData,
        List<FlSpot>> with WeightChartDataRef {
  _WeightChartDataProviderElement(super.provider);

  @override
  ChartPeriod get period => (origin as WeightChartDataProvider).period;
}

String _$caloriesChartDataHash() => r'249c266be0bde2b1ef4d805b5284f7b6f00070be';

abstract class _$CaloriesChartData
    extends BuildlessAutoDisposeAsyncNotifier<List<FlSpot>> {
  late final ChartPeriod period;

  FutureOr<List<FlSpot>> build(
    ChartPeriod period,
  );
}

/// See also [CaloriesChartData].
@ProviderFor(CaloriesChartData)
const caloriesChartDataProvider = CaloriesChartDataFamily();

/// See also [CaloriesChartData].
class CaloriesChartDataFamily extends Family<AsyncValue<List<FlSpot>>> {
  /// See also [CaloriesChartData].
  const CaloriesChartDataFamily();

  /// See also [CaloriesChartData].
  CaloriesChartDataProvider call(
    ChartPeriod period,
  ) {
    return CaloriesChartDataProvider(
      period,
    );
  }

  @override
  CaloriesChartDataProvider getProviderOverride(
    covariant CaloriesChartDataProvider provider,
  ) {
    return call(
      provider.period,
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
  String? get name => r'caloriesChartDataProvider';
}

/// See also [CaloriesChartData].
class CaloriesChartDataProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CaloriesChartData, List<FlSpot>> {
  /// See also [CaloriesChartData].
  CaloriesChartDataProvider(
    ChartPeriod period,
  ) : this._internal(
          () => CaloriesChartData()..period = period,
          from: caloriesChartDataProvider,
          name: r'caloriesChartDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$caloriesChartDataHash,
          dependencies: CaloriesChartDataFamily._dependencies,
          allTransitiveDependencies:
              CaloriesChartDataFamily._allTransitiveDependencies,
          period: period,
        );

  CaloriesChartDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
  }) : super.internal();

  final ChartPeriod period;

  @override
  FutureOr<List<FlSpot>> runNotifierBuild(
    covariant CaloriesChartData notifier,
  ) {
    return notifier.build(
      period,
    );
  }

  @override
  Override overrideWith(CaloriesChartData Function() create) {
    return ProviderOverride(
      origin: this,
      override: CaloriesChartDataProvider._internal(
        () => create()..period = period,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CaloriesChartData, List<FlSpot>>
      createElement() {
    return _CaloriesChartDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CaloriesChartDataProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CaloriesChartDataRef
    on AutoDisposeAsyncNotifierProviderRef<List<FlSpot>> {
  /// The parameter `period` of this provider.
  ChartPeriod get period;
}

class _CaloriesChartDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CaloriesChartData,
        List<FlSpot>> with CaloriesChartDataRef {
  _CaloriesChartDataProviderElement(super.provider);

  @override
  ChartPeriod get period => (origin as CaloriesChartDataProvider).period;
}

String _$proteinChartDataHash() => r'a4faf60209ebcfbe67993b7804ac8f2477984ef3';

abstract class _$ProteinChartData
    extends BuildlessAutoDisposeAsyncNotifier<List<FlSpot>> {
  late final ChartPeriod period;

  FutureOr<List<FlSpot>> build(
    ChartPeriod period,
  );
}

/// See also [ProteinChartData].
@ProviderFor(ProteinChartData)
const proteinChartDataProvider = ProteinChartDataFamily();

/// See also [ProteinChartData].
class ProteinChartDataFamily extends Family<AsyncValue<List<FlSpot>>> {
  /// See also [ProteinChartData].
  const ProteinChartDataFamily();

  /// See also [ProteinChartData].
  ProteinChartDataProvider call(
    ChartPeriod period,
  ) {
    return ProteinChartDataProvider(
      period,
    );
  }

  @override
  ProteinChartDataProvider getProviderOverride(
    covariant ProteinChartDataProvider provider,
  ) {
    return call(
      provider.period,
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
  String? get name => r'proteinChartDataProvider';
}

/// See also [ProteinChartData].
class ProteinChartDataProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProteinChartData, List<FlSpot>> {
  /// See also [ProteinChartData].
  ProteinChartDataProvider(
    ChartPeriod period,
  ) : this._internal(
          () => ProteinChartData()..period = period,
          from: proteinChartDataProvider,
          name: r'proteinChartDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$proteinChartDataHash,
          dependencies: ProteinChartDataFamily._dependencies,
          allTransitiveDependencies:
              ProteinChartDataFamily._allTransitiveDependencies,
          period: period,
        );

  ProteinChartDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
  }) : super.internal();

  final ChartPeriod period;

  @override
  FutureOr<List<FlSpot>> runNotifierBuild(
    covariant ProteinChartData notifier,
  ) {
    return notifier.build(
      period,
    );
  }

  @override
  Override overrideWith(ProteinChartData Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProteinChartDataProvider._internal(
        () => create()..period = period,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProteinChartData, List<FlSpot>>
      createElement() {
    return _ProteinChartDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProteinChartDataProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProteinChartDataRef on AutoDisposeAsyncNotifierProviderRef<List<FlSpot>> {
  /// The parameter `period` of this provider.
  ChartPeriod get period;
}

class _ProteinChartDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProteinChartData,
        List<FlSpot>> with ProteinChartDataRef {
  _ProteinChartDataProviderElement(super.provider);

  @override
  ChartPeriod get period => (origin as ProteinChartDataProvider).period;
}

String _$bodyFatChartDataHash() => r'46a50985fbe67b93530cfbf60650acc33139c5f8';

abstract class _$BodyFatChartData
    extends BuildlessAutoDisposeAsyncNotifier<List<FlSpot>> {
  late final ChartPeriod period;

  FutureOr<List<FlSpot>> build(
    ChartPeriod period,
  );
}

/// See also [BodyFatChartData].
@ProviderFor(BodyFatChartData)
const bodyFatChartDataProvider = BodyFatChartDataFamily();

/// See also [BodyFatChartData].
class BodyFatChartDataFamily extends Family<AsyncValue<List<FlSpot>>> {
  /// See also [BodyFatChartData].
  const BodyFatChartDataFamily();

  /// See also [BodyFatChartData].
  BodyFatChartDataProvider call(
    ChartPeriod period,
  ) {
    return BodyFatChartDataProvider(
      period,
    );
  }

  @override
  BodyFatChartDataProvider getProviderOverride(
    covariant BodyFatChartDataProvider provider,
  ) {
    return call(
      provider.period,
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
  String? get name => r'bodyFatChartDataProvider';
}

/// See also [BodyFatChartData].
class BodyFatChartDataProvider extends AutoDisposeAsyncNotifierProviderImpl<
    BodyFatChartData, List<FlSpot>> {
  /// See also [BodyFatChartData].
  BodyFatChartDataProvider(
    ChartPeriod period,
  ) : this._internal(
          () => BodyFatChartData()..period = period,
          from: bodyFatChartDataProvider,
          name: r'bodyFatChartDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bodyFatChartDataHash,
          dependencies: BodyFatChartDataFamily._dependencies,
          allTransitiveDependencies:
              BodyFatChartDataFamily._allTransitiveDependencies,
          period: period,
        );

  BodyFatChartDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
  }) : super.internal();

  final ChartPeriod period;

  @override
  FutureOr<List<FlSpot>> runNotifierBuild(
    covariant BodyFatChartData notifier,
  ) {
    return notifier.build(
      period,
    );
  }

  @override
  Override overrideWith(BodyFatChartData Function() create) {
    return ProviderOverride(
      origin: this,
      override: BodyFatChartDataProvider._internal(
        () => create()..period = period,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BodyFatChartData, List<FlSpot>>
      createElement() {
    return _BodyFatChartDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BodyFatChartDataProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BodyFatChartDataRef on AutoDisposeAsyncNotifierProviderRef<List<FlSpot>> {
  /// The parameter `period` of this provider.
  ChartPeriod get period;
}

class _BodyFatChartDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BodyFatChartData,
        List<FlSpot>> with BodyFatChartDataRef {
  _BodyFatChartDataProviderElement(super.provider);

  @override
  ChartPeriod get period => (origin as BodyFatChartDataProvider).period;
}

String _$muscleMassChartDataHash() =>
    r'2baea945bd1c3308ddf476912232c99aa3c1af3a';

abstract class _$MuscleMassChartData
    extends BuildlessAutoDisposeAsyncNotifier<List<FlSpot>> {
  late final ChartPeriod period;

  FutureOr<List<FlSpot>> build(
    ChartPeriod period,
  );
}

/// See also [MuscleMassChartData].
@ProviderFor(MuscleMassChartData)
const muscleMassChartDataProvider = MuscleMassChartDataFamily();

/// See also [MuscleMassChartData].
class MuscleMassChartDataFamily extends Family<AsyncValue<List<FlSpot>>> {
  /// See also [MuscleMassChartData].
  const MuscleMassChartDataFamily();

  /// See also [MuscleMassChartData].
  MuscleMassChartDataProvider call(
    ChartPeriod period,
  ) {
    return MuscleMassChartDataProvider(
      period,
    );
  }

  @override
  MuscleMassChartDataProvider getProviderOverride(
    covariant MuscleMassChartDataProvider provider,
  ) {
    return call(
      provider.period,
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
  String? get name => r'muscleMassChartDataProvider';
}

/// See also [MuscleMassChartData].
class MuscleMassChartDataProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MuscleMassChartData, List<FlSpot>> {
  /// See also [MuscleMassChartData].
  MuscleMassChartDataProvider(
    ChartPeriod period,
  ) : this._internal(
          () => MuscleMassChartData()..period = period,
          from: muscleMassChartDataProvider,
          name: r'muscleMassChartDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$muscleMassChartDataHash,
          dependencies: MuscleMassChartDataFamily._dependencies,
          allTransitiveDependencies:
              MuscleMassChartDataFamily._allTransitiveDependencies,
          period: period,
        );

  MuscleMassChartDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
  }) : super.internal();

  final ChartPeriod period;

  @override
  FutureOr<List<FlSpot>> runNotifierBuild(
    covariant MuscleMassChartData notifier,
  ) {
    return notifier.build(
      period,
    );
  }

  @override
  Override overrideWith(MuscleMassChartData Function() create) {
    return ProviderOverride(
      origin: this,
      override: MuscleMassChartDataProvider._internal(
        () => create()..period = period,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MuscleMassChartData, List<FlSpot>>
      createElement() {
    return _MuscleMassChartDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MuscleMassChartDataProvider && other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MuscleMassChartDataRef
    on AutoDisposeAsyncNotifierProviderRef<List<FlSpot>> {
  /// The parameter `period` of this provider.
  ChartPeriod get period;
}

class _MuscleMassChartDataProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MuscleMassChartData,
        List<FlSpot>> with MuscleMassChartDataRef {
  _MuscleMassChartDataProviderElement(super.provider);

  @override
  ChartPeriod get period => (origin as MuscleMassChartDataProvider).period;
}

String _$strengthProgressHash() => r'2b61f1fe037d647a8b4d3cb72bf630090c1d46cd';

abstract class _$StrengthProgress
    extends BuildlessAutoDisposeAsyncNotifier<List<FlSpot>> {
  late final String exerciseId;
  late final ChartPeriod period;

  FutureOr<List<FlSpot>> build(
    String exerciseId,
    ChartPeriod period,
  );
}

/// See also [StrengthProgress].
@ProviderFor(StrengthProgress)
const strengthProgressProvider = StrengthProgressFamily();

/// See also [StrengthProgress].
class StrengthProgressFamily extends Family<AsyncValue<List<FlSpot>>> {
  /// See also [StrengthProgress].
  const StrengthProgressFamily();

  /// See also [StrengthProgress].
  StrengthProgressProvider call(
    String exerciseId,
    ChartPeriod period,
  ) {
    return StrengthProgressProvider(
      exerciseId,
      period,
    );
  }

  @override
  StrengthProgressProvider getProviderOverride(
    covariant StrengthProgressProvider provider,
  ) {
    return call(
      provider.exerciseId,
      provider.period,
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
  String? get name => r'strengthProgressProvider';
}

/// See also [StrengthProgress].
class StrengthProgressProvider extends AutoDisposeAsyncNotifierProviderImpl<
    StrengthProgress, List<FlSpot>> {
  /// See also [StrengthProgress].
  StrengthProgressProvider(
    String exerciseId,
    ChartPeriod period,
  ) : this._internal(
          () => StrengthProgress()
            ..exerciseId = exerciseId
            ..period = period,
          from: strengthProgressProvider,
          name: r'strengthProgressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$strengthProgressHash,
          dependencies: StrengthProgressFamily._dependencies,
          allTransitiveDependencies:
              StrengthProgressFamily._allTransitiveDependencies,
          exerciseId: exerciseId,
          period: period,
        );

  StrengthProgressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.exerciseId,
    required this.period,
  }) : super.internal();

  final String exerciseId;
  final ChartPeriod period;

  @override
  FutureOr<List<FlSpot>> runNotifierBuild(
    covariant StrengthProgress notifier,
  ) {
    return notifier.build(
      exerciseId,
      period,
    );
  }

  @override
  Override overrideWith(StrengthProgress Function() create) {
    return ProviderOverride(
      origin: this,
      override: StrengthProgressProvider._internal(
        () => create()
          ..exerciseId = exerciseId
          ..period = period,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        exerciseId: exerciseId,
        period: period,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<StrengthProgress, List<FlSpot>>
      createElement() {
    return _StrengthProgressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StrengthProgressProvider &&
        other.exerciseId == exerciseId &&
        other.period == period;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exerciseId.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StrengthProgressRef on AutoDisposeAsyncNotifierProviderRef<List<FlSpot>> {
  /// The parameter `exerciseId` of this provider.
  String get exerciseId;

  /// The parameter `period` of this provider.
  ChartPeriod get period;
}

class _StrengthProgressProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StrengthProgress,
        List<FlSpot>> with StrengthProgressRef {
  _StrengthProgressProviderElement(super.provider);

  @override
  String get exerciseId => (origin as StrengthProgressProvider).exerciseId;
  @override
  ChartPeriod get period => (origin as StrengthProgressProvider).period;
}

String _$goalPredictionHash() => r'a200bcb9de3c270fd87f80bbccd78278f0636a4d';

/// See also [GoalPrediction].
@ProviderFor(GoalPrediction)
final goalPredictionProvider = AutoDisposeAsyncNotifierProvider<GoalPrediction,
    entities.GoalPrediction>.internal(
  GoalPrediction.new,
  name: r'goalPredictionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$goalPredictionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GoalPrediction = AutoDisposeAsyncNotifier<entities.GoalPrediction>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
