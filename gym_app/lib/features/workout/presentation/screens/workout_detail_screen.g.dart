// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_detail_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutSessionDetailHash() =>
    r'af7e46f3bd1e9f5ce9074ffe0679e63be2042ede';

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

/// See also [workoutSessionDetail].
@ProviderFor(workoutSessionDetail)
const workoutSessionDetailProvider = WorkoutSessionDetailFamily();

/// See also [workoutSessionDetail].
class WorkoutSessionDetailFamily extends Family<AsyncValue<WorkoutSession?>> {
  /// See also [workoutSessionDetail].
  const WorkoutSessionDetailFamily();

  /// See also [workoutSessionDetail].
  WorkoutSessionDetailProvider call(
    String id,
  ) {
    return WorkoutSessionDetailProvider(
      id,
    );
  }

  @override
  WorkoutSessionDetailProvider getProviderOverride(
    covariant WorkoutSessionDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'workoutSessionDetailProvider';
}

/// See also [workoutSessionDetail].
class WorkoutSessionDetailProvider
    extends AutoDisposeFutureProvider<WorkoutSession?> {
  /// See also [workoutSessionDetail].
  WorkoutSessionDetailProvider(
    String id,
  ) : this._internal(
          (ref) => workoutSessionDetail(
            ref as WorkoutSessionDetailRef,
            id,
          ),
          from: workoutSessionDetailProvider,
          name: r'workoutSessionDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$workoutSessionDetailHash,
          dependencies: WorkoutSessionDetailFamily._dependencies,
          allTransitiveDependencies:
              WorkoutSessionDetailFamily._allTransitiveDependencies,
          id: id,
        );

  WorkoutSessionDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<WorkoutSession?> Function(WorkoutSessionDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkoutSessionDetailProvider._internal(
        (ref) => create(ref as WorkoutSessionDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<WorkoutSession?> createElement() {
    return _WorkoutSessionDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutSessionDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WorkoutSessionDetailRef on AutoDisposeFutureProviderRef<WorkoutSession?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _WorkoutSessionDetailProviderElement
    extends AutoDisposeFutureProviderElement<WorkoutSession?>
    with WorkoutSessionDetailRef {
  _WorkoutSessionDetailProviderElement(super.provider);

  @override
  String get id => (origin as WorkoutSessionDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
