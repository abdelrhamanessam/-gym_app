// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$progressRepositoryHash() =>
    r'a16b119ab76267102125d2582790f677423136e4';

/// See also [progressRepository].
@ProviderFor(progressRepository)
final progressRepositoryProvider =
    AutoDisposeProvider<ProgressRepository>.internal(
  progressRepository,
  name: r'progressRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$progressRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProgressRepositoryRef = AutoDisposeProviderRef<ProgressRepository>;
String _$measurementsHash() => r'f7771eea2841de6273f736fba3572eeb22591c90';

/// See also [measurements].
@ProviderFor(measurements)
final measurementsProvider =
    AutoDisposeFutureProvider<List<BodyMeasurement>>.internal(
  measurements,
  name: r'measurementsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$measurementsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MeasurementsRef = AutoDisposeFutureProviderRef<List<BodyMeasurement>>;
String _$latestMeasurementHash() => r'a79f66267103aaabdc36b710e87934ea8dbc9c24';

/// See also [latestMeasurement].
@ProviderFor(latestMeasurement)
final latestMeasurementProvider =
    AutoDisposeFutureProvider<BodyMeasurement?>.internal(
  latestMeasurement,
  name: r'latestMeasurementProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$latestMeasurementHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LatestMeasurementRef = AutoDisposeFutureProviderRef<BodyMeasurement?>;
String _$bodyGoalsHash() => r'666b8432ac7e21a243e55f02164cc0ae2cde431f';

/// See also [bodyGoals].
@ProviderFor(bodyGoals)
final bodyGoalsProvider = AutoDisposeFutureProvider<List<BodyGoal>>.internal(
  bodyGoals,
  name: r'bodyGoalsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bodyGoalsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BodyGoalsRef = AutoDisposeFutureProviderRef<List<BodyGoal>>;
String _$progressPhotosHash() => r'd3ef82b6cc89c67cc677043981ecb4199763c29b';

/// See also [progressPhotos].
@ProviderFor(progressPhotos)
final progressPhotosProvider =
    AutoDisposeFutureProvider<List<ProgressPhoto>>.internal(
  progressPhotos,
  name: r'progressPhotosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$progressPhotosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProgressPhotosRef = AutoDisposeFutureProviderRef<List<ProgressPhoto>>;
String _$addMeasurementHash() => r'1de22580850a9f26ed6ac671c6afe5b03581e81d';

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

/// See also [addMeasurement].
@ProviderFor(addMeasurement)
const addMeasurementProvider = AddMeasurementFamily();

/// See also [addMeasurement].
class AddMeasurementFamily extends Family<AsyncValue<void>> {
  /// See also [addMeasurement].
  const AddMeasurementFamily();

  /// See also [addMeasurement].
  AddMeasurementProvider call(
    BodyMeasurement measurement,
  ) {
    return AddMeasurementProvider(
      measurement,
    );
  }

  @override
  AddMeasurementProvider getProviderOverride(
    covariant AddMeasurementProvider provider,
  ) {
    return call(
      provider.measurement,
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
  String? get name => r'addMeasurementProvider';
}

/// See also [addMeasurement].
class AddMeasurementProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addMeasurement].
  AddMeasurementProvider(
    BodyMeasurement measurement,
  ) : this._internal(
          (ref) => addMeasurement(
            ref as AddMeasurementRef,
            measurement,
          ),
          from: addMeasurementProvider,
          name: r'addMeasurementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addMeasurementHash,
          dependencies: AddMeasurementFamily._dependencies,
          allTransitiveDependencies:
              AddMeasurementFamily._allTransitiveDependencies,
          measurement: measurement,
        );

  AddMeasurementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.measurement,
  }) : super.internal();

  final BodyMeasurement measurement;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddMeasurementRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddMeasurementProvider._internal(
        (ref) => create(ref as AddMeasurementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        measurement: measurement,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddMeasurementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddMeasurementProvider && other.measurement == measurement;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, measurement.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddMeasurementRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `measurement` of this provider.
  BodyMeasurement get measurement;
}

class _AddMeasurementProviderElement
    extends AutoDisposeFutureProviderElement<void> with AddMeasurementRef {
  _AddMeasurementProviderElement(super.provider);

  @override
  BodyMeasurement get measurement =>
      (origin as AddMeasurementProvider).measurement;
}

String _$saveBodyGoalHash() => r'57c0e0564adf39e33cba6d095b3e313b14540cec';

/// See also [saveBodyGoal].
@ProviderFor(saveBodyGoal)
const saveBodyGoalProvider = SaveBodyGoalFamily();

/// See also [saveBodyGoal].
class SaveBodyGoalFamily extends Family<AsyncValue<void>> {
  /// See also [saveBodyGoal].
  const SaveBodyGoalFamily();

  /// See also [saveBodyGoal].
  SaveBodyGoalProvider call(
    BodyGoal goal,
  ) {
    return SaveBodyGoalProvider(
      goal,
    );
  }

  @override
  SaveBodyGoalProvider getProviderOverride(
    covariant SaveBodyGoalProvider provider,
  ) {
    return call(
      provider.goal,
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
  String? get name => r'saveBodyGoalProvider';
}

/// See also [saveBodyGoal].
class SaveBodyGoalProvider extends AutoDisposeFutureProvider<void> {
  /// See also [saveBodyGoal].
  SaveBodyGoalProvider(
    BodyGoal goal,
  ) : this._internal(
          (ref) => saveBodyGoal(
            ref as SaveBodyGoalRef,
            goal,
          ),
          from: saveBodyGoalProvider,
          name: r'saveBodyGoalProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveBodyGoalHash,
          dependencies: SaveBodyGoalFamily._dependencies,
          allTransitiveDependencies:
              SaveBodyGoalFamily._allTransitiveDependencies,
          goal: goal,
        );

  SaveBodyGoalProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.goal,
  }) : super.internal();

  final BodyGoal goal;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveBodyGoalRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveBodyGoalProvider._internal(
        (ref) => create(ref as SaveBodyGoalRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        goal: goal,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveBodyGoalProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveBodyGoalProvider && other.goal == goal;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, goal.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveBodyGoalRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `goal` of this provider.
  BodyGoal get goal;
}

class _SaveBodyGoalProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveBodyGoalRef {
  _SaveBodyGoalProviderElement(super.provider);

  @override
  BodyGoal get goal => (origin as SaveBodyGoalProvider).goal;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
