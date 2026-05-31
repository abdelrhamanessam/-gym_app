// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamification_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userXpHash() => r'3b23f9763fddad04fe0de7b1d320ec9febdad28a';

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

abstract class _$UserXp
    extends BuildlessAutoDisposeAsyncNotifier<entities.UserXp?> {
  late final String userId;

  FutureOr<entities.UserXp?> build(
    String userId,
  );
}

/// See also [UserXp].
@ProviderFor(UserXp)
const userXpProvider = UserXpFamily();

/// See also [UserXp].
class UserXpFamily extends Family<AsyncValue<entities.UserXp?>> {
  /// See also [UserXp].
  const UserXpFamily();

  /// See also [UserXp].
  UserXpProvider call(
    String userId,
  ) {
    return UserXpProvider(
      userId,
    );
  }

  @override
  UserXpProvider getProviderOverride(
    covariant UserXpProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'userXpProvider';
}

/// See also [UserXp].
class UserXpProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UserXp, entities.UserXp?> {
  /// See also [UserXp].
  UserXpProvider(
    String userId,
  ) : this._internal(
          () => UserXp()..userId = userId,
          from: userXpProvider,
          name: r'userXpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userXpHash,
          dependencies: UserXpFamily._dependencies,
          allTransitiveDependencies: UserXpFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserXpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<entities.UserXp?> runNotifierBuild(
    covariant UserXp notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserXp Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserXpProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserXp, entities.UserXp?>
      createElement() {
    return _UserXpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserXpProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserXpRef on AutoDisposeAsyncNotifierProviderRef<entities.UserXp?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserXpProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserXp, entities.UserXp?>
    with UserXpRef {
  _UserXpProviderElement(super.provider);

  @override
  String get userId => (origin as UserXpProvider).userId;
}

String _$achievementsHash() => r'e5ec3f2a92136332d42baffda21185374968f2b0';

/// See also [Achievements].
@ProviderFor(Achievements)
final achievementsProvider =
    AutoDisposeAsyncNotifierProvider<Achievements, List<Achievement>>.internal(
  Achievements.new,
  name: r'achievementsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$achievementsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Achievements = AutoDisposeAsyncNotifier<List<Achievement>>;
String _$userAchievementsHash() => r'0d75f41ff76567f9210a0e5d07a97d4c29675e61';

abstract class _$UserAchievements
    extends BuildlessAutoDisposeAsyncNotifier<List<UserAchievement>> {
  late final String userId;

  FutureOr<List<UserAchievement>> build(
    String userId,
  );
}

/// See also [UserAchievements].
@ProviderFor(UserAchievements)
const userAchievementsProvider = UserAchievementsFamily();

/// See also [UserAchievements].
class UserAchievementsFamily extends Family<AsyncValue<List<UserAchievement>>> {
  /// See also [UserAchievements].
  const UserAchievementsFamily();

  /// See also [UserAchievements].
  UserAchievementsProvider call(
    String userId,
  ) {
    return UserAchievementsProvider(
      userId,
    );
  }

  @override
  UserAchievementsProvider getProviderOverride(
    covariant UserAchievementsProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'userAchievementsProvider';
}

/// See also [UserAchievements].
class UserAchievementsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserAchievements, List<UserAchievement>> {
  /// See also [UserAchievements].
  UserAchievementsProvider(
    String userId,
  ) : this._internal(
          () => UserAchievements()..userId = userId,
          from: userAchievementsProvider,
          name: r'userAchievementsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userAchievementsHash,
          dependencies: UserAchievementsFamily._dependencies,
          allTransitiveDependencies:
              UserAchievementsFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserAchievementsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<List<UserAchievement>> runNotifierBuild(
    covariant UserAchievements notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserAchievements Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserAchievementsProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserAchievements,
      List<UserAchievement>> createElement() {
    return _UserAchievementsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserAchievementsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserAchievementsRef
    on AutoDisposeAsyncNotifierProviderRef<List<UserAchievement>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserAchievementsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserAchievements,
        List<UserAchievement>> with UserAchievementsRef {
  _UserAchievementsProviderElement(super.provider);

  @override
  String get userId => (origin as UserAchievementsProvider).userId;
}

String _$leaderboardHash() => r'cac7deb42183a54b125c81bf06bc8d3f32d1d3ee';

/// See also [Leaderboard].
@ProviderFor(Leaderboard)
final leaderboardProvider = AutoDisposeAsyncNotifierProvider<Leaderboard,
    List<Map<String, dynamic>>>.internal(
  Leaderboard.new,
  name: r'leaderboardProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$leaderboardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Leaderboard = AutoDisposeAsyncNotifier<List<Map<String, dynamic>>>;
String _$checkAchievementsHash() => r'dc636c352e78ce41a77fa0bed7ec18c197b7d8bf';

abstract class _$CheckAchievements
    extends BuildlessAutoDisposeAsyncNotifier<List<Achievement>> {
  late final String userId;

  FutureOr<List<Achievement>> build(
    String userId,
  );
}

/// See also [CheckAchievements].
@ProviderFor(CheckAchievements)
const checkAchievementsProvider = CheckAchievementsFamily();

/// See also [CheckAchievements].
class CheckAchievementsFamily extends Family<AsyncValue<List<Achievement>>> {
  /// See also [CheckAchievements].
  const CheckAchievementsFamily();

  /// See also [CheckAchievements].
  CheckAchievementsProvider call(
    String userId,
  ) {
    return CheckAchievementsProvider(
      userId,
    );
  }

  @override
  CheckAchievementsProvider getProviderOverride(
    covariant CheckAchievementsProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'checkAchievementsProvider';
}

/// See also [CheckAchievements].
class CheckAchievementsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CheckAchievements, List<Achievement>> {
  /// See also [CheckAchievements].
  CheckAchievementsProvider(
    String userId,
  ) : this._internal(
          () => CheckAchievements()..userId = userId,
          from: checkAchievementsProvider,
          name: r'checkAchievementsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkAchievementsHash,
          dependencies: CheckAchievementsFamily._dependencies,
          allTransitiveDependencies:
              CheckAchievementsFamily._allTransitiveDependencies,
          userId: userId,
        );

  CheckAchievementsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<List<Achievement>> runNotifierBuild(
    covariant CheckAchievements notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(CheckAchievements Function() create) {
    return ProviderOverride(
      origin: this,
      override: CheckAchievementsProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CheckAchievements, List<Achievement>>
      createElement() {
    return _CheckAchievementsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckAchievementsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CheckAchievementsRef
    on AutoDisposeAsyncNotifierProviderRef<List<Achievement>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _CheckAchievementsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CheckAchievements,
        List<Achievement>> with CheckAchievementsRef {
  _CheckAchievementsProviderElement(super.provider);

  @override
  String get userId => (origin as CheckAchievementsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
