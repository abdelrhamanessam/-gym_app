// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_template_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveWorkoutTemplateHash() =>
    r'214dc6522ac76fd48581ca105512652c42db0c6e';

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

/// See also [saveWorkoutTemplate].
@ProviderFor(saveWorkoutTemplate)
const saveWorkoutTemplateProvider = SaveWorkoutTemplateFamily();

/// See also [saveWorkoutTemplate].
class SaveWorkoutTemplateFamily extends Family<AsyncValue<void>> {
  /// See also [saveWorkoutTemplate].
  const SaveWorkoutTemplateFamily();

  /// See also [saveWorkoutTemplate].
  SaveWorkoutTemplateProvider call(
    WorkoutTemplate template,
  ) {
    return SaveWorkoutTemplateProvider(
      template,
    );
  }

  @override
  SaveWorkoutTemplateProvider getProviderOverride(
    covariant SaveWorkoutTemplateProvider provider,
  ) {
    return call(
      provider.template,
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
  String? get name => r'saveWorkoutTemplateProvider';
}

/// See also [saveWorkoutTemplate].
class SaveWorkoutTemplateProvider extends AutoDisposeFutureProvider<void> {
  /// See also [saveWorkoutTemplate].
  SaveWorkoutTemplateProvider(
    WorkoutTemplate template,
  ) : this._internal(
          (ref) => saveWorkoutTemplate(
            ref as SaveWorkoutTemplateRef,
            template,
          ),
          from: saveWorkoutTemplateProvider,
          name: r'saveWorkoutTemplateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveWorkoutTemplateHash,
          dependencies: SaveWorkoutTemplateFamily._dependencies,
          allTransitiveDependencies:
              SaveWorkoutTemplateFamily._allTransitiveDependencies,
          template: template,
        );

  SaveWorkoutTemplateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.template,
  }) : super.internal();

  final WorkoutTemplate template;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveWorkoutTemplateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveWorkoutTemplateProvider._internal(
        (ref) => create(ref as SaveWorkoutTemplateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        template: template,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveWorkoutTemplateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveWorkoutTemplateProvider && other.template == template;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, template.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveWorkoutTemplateRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `template` of this provider.
  WorkoutTemplate get template;
}

class _SaveWorkoutTemplateProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveWorkoutTemplateRef {
  _SaveWorkoutTemplateProviderElement(super.provider);

  @override
  WorkoutTemplate get template =>
      (origin as SaveWorkoutTemplateProvider).template;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
