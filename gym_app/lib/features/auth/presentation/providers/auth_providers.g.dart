// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRemoteDataSourceHash() =>
    r'da0ea50e72a442c6569c324488ce7c594a2d5900';

/// See also [authRemoteDataSource].
@ProviderFor(authRemoteDataSource)
final authRemoteDataSourceProvider =
    AutoDisposeProvider<AuthRemoteDataSource>.internal(
  authRemoteDataSource,
  name: r'authRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRemoteDataSourceRef = AutoDisposeProviderRef<AuthRemoteDataSource>;
String _$authRepositoryHash() => r'6268e0ddfbe44b94edfab963f0c223b425f6717b';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$firestoreHash() => r'57116d7f1e2dda861cf1362ca8fe50edc7a149b3';

/// See also [firestore].
@ProviderFor(firestore)
final firestoreProvider = AutoDisposeProvider<FirebaseFirestore>.internal(
  firestore,
  name: r'firestoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirestoreRef = AutoDisposeProviderRef<FirebaseFirestore>;
String _$googleSignInHash() => r'd40ab5cdc53c055f32ed5100dc3d5ff0584521e5';

/// See also [googleSignIn].
@ProviderFor(googleSignIn)
final googleSignInProvider = AutoDisposeProvider<GoogleSignIn>.internal(
  googleSignIn,
  name: r'googleSignInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$googleSignInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GoogleSignInRef = AutoDisposeProviderRef<GoogleSignIn>;
String _$authStateHash() => r'a706db024a644ae9c496cccdfa57935f6ab82e1f';

/// See also [authState].
@ProviderFor(authState)
final authStateProvider = AutoDisposeStreamProvider<AuthUser?>.internal(
  authState,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateRef = AutoDisposeStreamProviderRef<AuthUser?>;
String _$signInHash() => r'49a2e260cb677e94fba34597bcefa14aa1b30cf7';

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

/// See also [signIn].
@ProviderFor(signIn)
const signInProvider = SignInFamily();

/// See also [signIn].
class SignInFamily extends Family<AsyncValue<void>> {
  /// See also [signIn].
  const SignInFamily();

  /// See also [signIn].
  SignInProvider call({
    required String email,
    required String password,
  }) {
    return SignInProvider(
      email: email,
      password: password,
    );
  }

  @override
  SignInProvider getProviderOverride(
    covariant SignInProvider provider,
  ) {
    return call(
      email: provider.email,
      password: provider.password,
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
  String? get name => r'signInProvider';
}

/// See also [signIn].
class SignInProvider extends AutoDisposeFutureProvider<void> {
  /// See also [signIn].
  SignInProvider({
    required String email,
    required String password,
  }) : this._internal(
          (ref) => signIn(
            ref as SignInRef,
            email: email,
            password: password,
          ),
          from: signInProvider,
          name: r'signInProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signInHash,
          dependencies: SignInFamily._dependencies,
          allTransitiveDependencies: SignInFamily._allTransitiveDependencies,
          email: email,
          password: password,
        );

  SignInProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<void> Function(SignInRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignInProvider._internal(
        (ref) => create(ref as SignInRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SignInProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignInRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _SignInProviderElement extends AutoDisposeFutureProviderElement<void>
    with SignInRef {
  _SignInProviderElement(super.provider);

  @override
  String get email => (origin as SignInProvider).email;
  @override
  String get password => (origin as SignInProvider).password;
}

String _$signUpHash() => r'024feac3bba66fd5d1009616d3c0740d84247ce4';

/// See also [signUp].
@ProviderFor(signUp)
const signUpProvider = SignUpFamily();

/// See also [signUp].
class SignUpFamily extends Family<AsyncValue<void>> {
  /// See also [signUp].
  const SignUpFamily();

  /// See also [signUp].
  SignUpProvider call({
    required String email,
    required String password,
    required String displayName,
  }) {
    return SignUpProvider(
      email: email,
      password: password,
      displayName: displayName,
    );
  }

  @override
  SignUpProvider getProviderOverride(
    covariant SignUpProvider provider,
  ) {
    return call(
      email: provider.email,
      password: provider.password,
      displayName: provider.displayName,
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
  String? get name => r'signUpProvider';
}

/// See also [signUp].
class SignUpProvider extends AutoDisposeFutureProvider<void> {
  /// See also [signUp].
  SignUpProvider({
    required String email,
    required String password,
    required String displayName,
  }) : this._internal(
          (ref) => signUp(
            ref as SignUpRef,
            email: email,
            password: password,
            displayName: displayName,
          ),
          from: signUpProvider,
          name: r'signUpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signUpHash,
          dependencies: SignUpFamily._dependencies,
          allTransitiveDependencies: SignUpFamily._allTransitiveDependencies,
          email: email,
          password: password,
          displayName: displayName,
        );

  SignUpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
    required this.displayName,
  }) : super.internal();

  final String email;
  final String password;
  final String displayName;

  @override
  Override overrideWith(
    FutureOr<void> Function(SignUpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignUpProvider._internal(
        (ref) => create(ref as SignUpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
        displayName: displayName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SignUpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpProvider &&
        other.email == email &&
        other.password == password &&
        other.displayName == displayName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, displayName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignUpRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `displayName` of this provider.
  String get displayName;
}

class _SignUpProviderElement extends AutoDisposeFutureProviderElement<void>
    with SignUpRef {
  _SignUpProviderElement(super.provider);

  @override
  String get email => (origin as SignUpProvider).email;
  @override
  String get password => (origin as SignUpProvider).password;
  @override
  String get displayName => (origin as SignUpProvider).displayName;
}

String _$googleSignInActionHash() =>
    r'ea952d6de64e81fcbe59468fecc60ee15e936040';

/// See also [googleSignInAction].
@ProviderFor(googleSignInAction)
final googleSignInActionProvider = AutoDisposeFutureProvider<void>.internal(
  googleSignInAction,
  name: r'googleSignInActionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$googleSignInActionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GoogleSignInActionRef = AutoDisposeFutureProviderRef<void>;
String _$appleSignInActionHash() => r'd6023f5c858f5cfd4b2b2a37fd5f8f35d89b2f7b';

/// See also [appleSignInAction].
@ProviderFor(appleSignInAction)
final appleSignInActionProvider = AutoDisposeFutureProvider<void>.internal(
  appleSignInAction,
  name: r'appleSignInActionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appleSignInActionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppleSignInActionRef = AutoDisposeFutureProviderRef<void>;
String _$sendPasswordResetHash() => r'1e205ab803830519db87bde2ce1a9b46fde285a3';

/// See also [sendPasswordReset].
@ProviderFor(sendPasswordReset)
const sendPasswordResetProvider = SendPasswordResetFamily();

/// See also [sendPasswordReset].
class SendPasswordResetFamily extends Family<AsyncValue<void>> {
  /// See also [sendPasswordReset].
  const SendPasswordResetFamily();

  /// See also [sendPasswordReset].
  SendPasswordResetProvider call({
    required String email,
  }) {
    return SendPasswordResetProvider(
      email: email,
    );
  }

  @override
  SendPasswordResetProvider getProviderOverride(
    covariant SendPasswordResetProvider provider,
  ) {
    return call(
      email: provider.email,
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
  String? get name => r'sendPasswordResetProvider';
}

/// See also [sendPasswordReset].
class SendPasswordResetProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendPasswordReset].
  SendPasswordResetProvider({
    required String email,
  }) : this._internal(
          (ref) => sendPasswordReset(
            ref as SendPasswordResetRef,
            email: email,
          ),
          from: sendPasswordResetProvider,
          name: r'sendPasswordResetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendPasswordResetHash,
          dependencies: SendPasswordResetFamily._dependencies,
          allTransitiveDependencies:
              SendPasswordResetFamily._allTransitiveDependencies,
          email: email,
        );

  SendPasswordResetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendPasswordResetRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendPasswordResetProvider._internal(
        (ref) => create(ref as SendPasswordResetRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendPasswordResetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendPasswordResetProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SendPasswordResetRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;
}

class _SendPasswordResetProviderElement
    extends AutoDisposeFutureProviderElement<void> with SendPasswordResetRef {
  _SendPasswordResetProviderElement(super.provider);

  @override
  String get email => (origin as SendPasswordResetProvider).email;
}

String _$signOutActionHash() => r'e8b0a5eecee41e0df6388733875b905494cb6084';

/// See also [signOutAction].
@ProviderFor(signOutAction)
final signOutActionProvider = AutoDisposeFutureProvider<void>.internal(
  signOutAction,
  name: r'signOutActionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signOutActionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SignOutActionRef = AutoDisposeFutureProviderRef<void>;
String _$userProfileHash() => r'155ac6e9568295503cca9d3a0137da965c470819';

/// See also [userProfile].
@ProviderFor(userProfile)
const userProfileProvider = UserProfileFamily();

/// See also [userProfile].
class UserProfileFamily extends Family<AsyncValue<UserProfile>> {
  /// See also [userProfile].
  const UserProfileFamily();

  /// See also [userProfile].
  UserProfileProvider call({
    required String uid,
  }) {
    return UserProfileProvider(
      uid: uid,
    );
  }

  @override
  UserProfileProvider getProviderOverride(
    covariant UserProfileProvider provider,
  ) {
    return call(
      uid: provider.uid,
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
  String? get name => r'userProfileProvider';
}

/// See also [userProfile].
class UserProfileProvider extends AutoDisposeFutureProvider<UserProfile> {
  /// See also [userProfile].
  UserProfileProvider({
    required String uid,
  }) : this._internal(
          (ref) => userProfile(
            ref as UserProfileRef,
            uid: uid,
          ),
          from: userProfileProvider,
          name: r'userProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userProfileHash,
          dependencies: UserProfileFamily._dependencies,
          allTransitiveDependencies:
              UserProfileFamily._allTransitiveDependencies,
          uid: uid,
        );

  UserProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    FutureOr<UserProfile> Function(UserProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserProfileProvider._internal(
        (ref) => create(ref as UserProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserProfile> createElement() {
    return _UserProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserProfileRef on AutoDisposeFutureProviderRef<UserProfile> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _UserProfileProviderElement
    extends AutoDisposeFutureProviderElement<UserProfile> with UserProfileRef {
  _UserProfileProviderElement(super.provider);

  @override
  String get uid => (origin as UserProfileProvider).uid;
}

String _$updateUserProfileHash() => r'aee754e78bf1ca0f8796af5857f9253bd00a154f';

/// See also [updateUserProfile].
@ProviderFor(updateUserProfile)
const updateUserProfileProvider = UpdateUserProfileFamily();

/// See also [updateUserProfile].
class UpdateUserProfileFamily extends Family<AsyncValue<void>> {
  /// See also [updateUserProfile].
  const UpdateUserProfileFamily();

  /// See also [updateUserProfile].
  UpdateUserProfileProvider call({
    required String uid,
    required UserProfile profile,
  }) {
    return UpdateUserProfileProvider(
      uid: uid,
      profile: profile,
    );
  }

  @override
  UpdateUserProfileProvider getProviderOverride(
    covariant UpdateUserProfileProvider provider,
  ) {
    return call(
      uid: provider.uid,
      profile: provider.profile,
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
  String? get name => r'updateUserProfileProvider';
}

/// See also [updateUserProfile].
class UpdateUserProfileProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateUserProfile].
  UpdateUserProfileProvider({
    required String uid,
    required UserProfile profile,
  }) : this._internal(
          (ref) => updateUserProfile(
            ref as UpdateUserProfileRef,
            uid: uid,
            profile: profile,
          ),
          from: updateUserProfileProvider,
          name: r'updateUserProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateUserProfileHash,
          dependencies: UpdateUserProfileFamily._dependencies,
          allTransitiveDependencies:
              UpdateUserProfileFamily._allTransitiveDependencies,
          uid: uid,
          profile: profile,
        );

  UpdateUserProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
    required this.profile,
  }) : super.internal();

  final String uid;
  final UserProfile profile;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateUserProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateUserProfileProvider._internal(
        (ref) => create(ref as UpdateUserProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
        profile: profile,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateUserProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateUserProfileProvider &&
        other.uid == uid &&
        other.profile == profile;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);
    hash = _SystemHash.combine(hash, profile.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateUserProfileRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `uid` of this provider.
  String get uid;

  /// The parameter `profile` of this provider.
  UserProfile get profile;
}

class _UpdateUserProfileProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateUserProfileRef {
  _UpdateUserProfileProviderElement(super.provider);

  @override
  String get uid => (origin as UpdateUserProfileProvider).uid;
  @override
  UserProfile get profile => (origin as UpdateUserProfileProvider).profile;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
