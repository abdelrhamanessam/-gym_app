// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutRepositoryHash() => r'd3416401e58f59601582028d776c2fdb7afffbb9';

/// See also [workoutRepository].
@ProviderFor(workoutRepository)
final workoutRepositoryProvider =
    AutoDisposeProvider<WorkoutRepository>.internal(
  workoutRepository,
  name: r'workoutRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WorkoutRepositoryRef = AutoDisposeProviderRef<WorkoutRepository>;
String _$exercisesHash() => r'5cae91e8ae590afd16393dac717a910c94bfa9ea';

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

/// See also [exercises].
@ProviderFor(exercises)
const exercisesProvider = ExercisesFamily();

/// See also [exercises].
class ExercisesFamily extends Family<AsyncValue<List<Exercise>>> {
  /// See also [exercises].
  const ExercisesFamily();

  /// See also [exercises].
  ExercisesProvider call({
    MuscleGroup? muscleGroup,
  }) {
    return ExercisesProvider(
      muscleGroup: muscleGroup,
    );
  }

  @override
  ExercisesProvider getProviderOverride(
    covariant ExercisesProvider provider,
  ) {
    return call(
      muscleGroup: provider.muscleGroup,
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
  String? get name => r'exercisesProvider';
}

/// See also [exercises].
class ExercisesProvider extends AutoDisposeFutureProvider<List<Exercise>> {
  /// See also [exercises].
  ExercisesProvider({
    MuscleGroup? muscleGroup,
  }) : this._internal(
          (ref) => exercises(
            ref as ExercisesRef,
            muscleGroup: muscleGroup,
          ),
          from: exercisesProvider,
          name: r'exercisesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exercisesHash,
          dependencies: ExercisesFamily._dependencies,
          allTransitiveDependencies: ExercisesFamily._allTransitiveDependencies,
          muscleGroup: muscleGroup,
        );

  ExercisesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.muscleGroup,
  }) : super.internal();

  final MuscleGroup? muscleGroup;

  @override
  Override overrideWith(
    FutureOr<List<Exercise>> Function(ExercisesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExercisesProvider._internal(
        (ref) => create(ref as ExercisesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        muscleGroup: muscleGroup,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Exercise>> createElement() {
    return _ExercisesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExercisesProvider && other.muscleGroup == muscleGroup;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, muscleGroup.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExercisesRef on AutoDisposeFutureProviderRef<List<Exercise>> {
  /// The parameter `muscleGroup` of this provider.
  MuscleGroup? get muscleGroup;
}

class _ExercisesProviderElement
    extends AutoDisposeFutureProviderElement<List<Exercise>> with ExercisesRef {
  _ExercisesProviderElement(super.provider);

  @override
  MuscleGroup? get muscleGroup => (origin as ExercisesProvider).muscleGroup;
}

String _$exerciseDetailHash() => r'3a3b73b27f3c70a72003269aaacb97c7f1bd6776';

/// See also [exerciseDetail].
@ProviderFor(exerciseDetail)
const exerciseDetailProvider = ExerciseDetailFamily();

/// See also [exerciseDetail].
class ExerciseDetailFamily extends Family<AsyncValue<Exercise?>> {
  /// See also [exerciseDetail].
  const ExerciseDetailFamily();

  /// See also [exerciseDetail].
  ExerciseDetailProvider call(
    String id,
  ) {
    return ExerciseDetailProvider(
      id,
    );
  }

  @override
  ExerciseDetailProvider getProviderOverride(
    covariant ExerciseDetailProvider provider,
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
  String? get name => r'exerciseDetailProvider';
}

/// See also [exerciseDetail].
class ExerciseDetailProvider extends AutoDisposeFutureProvider<Exercise?> {
  /// See also [exerciseDetail].
  ExerciseDetailProvider(
    String id,
  ) : this._internal(
          (ref) => exerciseDetail(
            ref as ExerciseDetailRef,
            id,
          ),
          from: exerciseDetailProvider,
          name: r'exerciseDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exerciseDetailHash,
          dependencies: ExerciseDetailFamily._dependencies,
          allTransitiveDependencies:
              ExerciseDetailFamily._allTransitiveDependencies,
          id: id,
        );

  ExerciseDetailProvider._internal(
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
    FutureOr<Exercise?> Function(ExerciseDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExerciseDetailProvider._internal(
        (ref) => create(ref as ExerciseDetailRef),
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
  AutoDisposeFutureProviderElement<Exercise?> createElement() {
    return _ExerciseDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseDetailProvider && other.id == id;
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
mixin ExerciseDetailRef on AutoDisposeFutureProviderRef<Exercise?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ExerciseDetailProviderElement
    extends AutoDisposeFutureProviderElement<Exercise?> with ExerciseDetailRef {
  _ExerciseDetailProviderElement(super.provider);

  @override
  String get id => (origin as ExerciseDetailProvider).id;
}

String _$workoutSessionsHash() => r'e6298004344d65c3b981dfa65c4d1a06564f4380';

/// See also [workoutSessions].
@ProviderFor(workoutSessions)
const workoutSessionsProvider = WorkoutSessionsFamily();

/// See also [workoutSessions].
class WorkoutSessionsFamily extends Family<AsyncValue<List<WorkoutSession>>> {
  /// See also [workoutSessions].
  const WorkoutSessionsFamily();

  /// See also [workoutSessions].
  WorkoutSessionsProvider call({
    DateTime? date,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return WorkoutSessionsProvider(
      date: date,
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  WorkoutSessionsProvider getProviderOverride(
    covariant WorkoutSessionsProvider provider,
  ) {
    return call(
      date: provider.date,
      startDate: provider.startDate,
      endDate: provider.endDate,
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
  String? get name => r'workoutSessionsProvider';
}

/// See also [workoutSessions].
class WorkoutSessionsProvider
    extends AutoDisposeFutureProvider<List<WorkoutSession>> {
  /// See also [workoutSessions].
  WorkoutSessionsProvider({
    DateTime? date,
    DateTime? startDate,
    DateTime? endDate,
  }) : this._internal(
          (ref) => workoutSessions(
            ref as WorkoutSessionsRef,
            date: date,
            startDate: startDate,
            endDate: endDate,
          ),
          from: workoutSessionsProvider,
          name: r'workoutSessionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$workoutSessionsHash,
          dependencies: WorkoutSessionsFamily._dependencies,
          allTransitiveDependencies:
              WorkoutSessionsFamily._allTransitiveDependencies,
          date: date,
          startDate: startDate,
          endDate: endDate,
        );

  WorkoutSessionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final DateTime? date;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Override overrideWith(
    FutureOr<List<WorkoutSession>> Function(WorkoutSessionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkoutSessionsProvider._internal(
        (ref) => create(ref as WorkoutSessionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<WorkoutSession>> createElement() {
    return _WorkoutSessionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutSessionsProvider &&
        other.date == date &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WorkoutSessionsRef on AutoDisposeFutureProviderRef<List<WorkoutSession>> {
  /// The parameter `date` of this provider.
  DateTime? get date;

  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;
}

class _WorkoutSessionsProviderElement
    extends AutoDisposeFutureProviderElement<List<WorkoutSession>>
    with WorkoutSessionsRef {
  _WorkoutSessionsProviderElement(super.provider);

  @override
  DateTime? get date => (origin as WorkoutSessionsProvider).date;
  @override
  DateTime? get startDate => (origin as WorkoutSessionsProvider).startDate;
  @override
  DateTime? get endDate => (origin as WorkoutSessionsProvider).endDate;
}

String _$workoutTemplatesHash() => r'4fd70a887160d36488bacb7862edf548a7296b3d';

/// See also [workoutTemplates].
@ProviderFor(workoutTemplates)
final workoutTemplatesProvider =
    AutoDisposeFutureProvider<List<WorkoutTemplate>>.internal(
  workoutTemplates,
  name: r'workoutTemplatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutTemplatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WorkoutTemplatesRef
    = AutoDisposeFutureProviderRef<List<WorkoutTemplate>>;
String _$workoutProgramsHash() => r'77cd5e983fda61961f949278a1bd9762794ddddf';

/// See also [workoutPrograms].
@ProviderFor(workoutPrograms)
final workoutProgramsProvider =
    AutoDisposeFutureProvider<List<WorkoutProgram>>.internal(
  workoutPrograms,
  name: r'workoutProgramsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutProgramsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WorkoutProgramsRef = AutoDisposeFutureProviderRef<List<WorkoutProgram>>;
String _$saveWorkoutSessionHash() =>
    r'7b349901b9ba168cd3e80140c1d0604f55a8cdc6';

/// See also [saveWorkoutSession].
@ProviderFor(saveWorkoutSession)
const saveWorkoutSessionProvider = SaveWorkoutSessionFamily();

/// See also [saveWorkoutSession].
class SaveWorkoutSessionFamily extends Family<AsyncValue<void>> {
  /// See also [saveWorkoutSession].
  const SaveWorkoutSessionFamily();

  /// See also [saveWorkoutSession].
  SaveWorkoutSessionProvider call(
    WorkoutSession session,
  ) {
    return SaveWorkoutSessionProvider(
      session,
    );
  }

  @override
  SaveWorkoutSessionProvider getProviderOverride(
    covariant SaveWorkoutSessionProvider provider,
  ) {
    return call(
      provider.session,
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
  String? get name => r'saveWorkoutSessionProvider';
}

/// See also [saveWorkoutSession].
class SaveWorkoutSessionProvider extends AutoDisposeFutureProvider<void> {
  /// See also [saveWorkoutSession].
  SaveWorkoutSessionProvider(
    WorkoutSession session,
  ) : this._internal(
          (ref) => saveWorkoutSession(
            ref as SaveWorkoutSessionRef,
            session,
          ),
          from: saveWorkoutSessionProvider,
          name: r'saveWorkoutSessionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveWorkoutSessionHash,
          dependencies: SaveWorkoutSessionFamily._dependencies,
          allTransitiveDependencies:
              SaveWorkoutSessionFamily._allTransitiveDependencies,
          session: session,
        );

  SaveWorkoutSessionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.session,
  }) : super.internal();

  final WorkoutSession session;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveWorkoutSessionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveWorkoutSessionProvider._internal(
        (ref) => create(ref as SaveWorkoutSessionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        session: session,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveWorkoutSessionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveWorkoutSessionProvider && other.session == session;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, session.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveWorkoutSessionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `session` of this provider.
  WorkoutSession get session;
}

class _SaveWorkoutSessionProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveWorkoutSessionRef {
  _SaveWorkoutSessionProviderElement(super.provider);

  @override
  WorkoutSession get session => (origin as SaveWorkoutSessionProvider).session;
}

String _$workoutHistoryHash() => r'c7ae0ba7932a872b9081d26e92f4c0093c1edf93';

/// See also [workoutHistory].
@ProviderFor(workoutHistory)
final workoutHistoryProvider =
    AutoDisposeFutureProvider<List<WorkoutHistory>>.internal(
  workoutHistory,
  name: r'workoutHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WorkoutHistoryRef = AutoDisposeFutureProviderRef<List<WorkoutHistory>>;
String _$activeWorkoutHash() => r'dea1749e0c6025ec6d23141719ff059d4134499b';

/// See also [ActiveWorkout].
@ProviderFor(ActiveWorkout)
final activeWorkoutProvider = AutoDisposeNotifierProvider<ActiveWorkout,
    AsyncValue<WorkoutSession?>>.internal(
  ActiveWorkout.new,
  name: r'activeWorkoutProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeWorkoutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveWorkout = AutoDisposeNotifier<AsyncValue<WorkoutSession?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
