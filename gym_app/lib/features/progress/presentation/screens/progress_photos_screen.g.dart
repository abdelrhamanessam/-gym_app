// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_photos_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addPhotoHash() => r'11a4baa2afa3d28080bbbf65241c4b7ed782e638';

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

/// See also [addPhoto].
@ProviderFor(addPhoto)
const addPhotoProvider = AddPhotoFamily();

/// See also [addPhoto].
class AddPhotoFamily extends Family<AsyncValue<void>> {
  /// See also [addPhoto].
  const AddPhotoFamily();

  /// See also [addPhoto].
  AddPhotoProvider call(
    ProgressPhoto photo,
  ) {
    return AddPhotoProvider(
      photo,
    );
  }

  @override
  AddPhotoProvider getProviderOverride(
    covariant AddPhotoProvider provider,
  ) {
    return call(
      provider.photo,
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
  String? get name => r'addPhotoProvider';
}

/// See also [addPhoto].
class AddPhotoProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addPhoto].
  AddPhotoProvider(
    ProgressPhoto photo,
  ) : this._internal(
          (ref) => addPhoto(
            ref as AddPhotoRef,
            photo,
          ),
          from: addPhotoProvider,
          name: r'addPhotoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addPhotoHash,
          dependencies: AddPhotoFamily._dependencies,
          allTransitiveDependencies: AddPhotoFamily._allTransitiveDependencies,
          photo: photo,
        );

  AddPhotoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.photo,
  }) : super.internal();

  final ProgressPhoto photo;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddPhotoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddPhotoProvider._internal(
        (ref) => create(ref as AddPhotoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        photo: photo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddPhotoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddPhotoProvider && other.photo == photo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, photo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddPhotoRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `photo` of this provider.
  ProgressPhoto get photo;
}

class _AddPhotoProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddPhotoRef {
  _AddPhotoProviderElement(super.provider);

  @override
  ProgressPhoto get photo => (origin as AddPhotoProvider).photo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
