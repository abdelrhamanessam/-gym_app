// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nutritionRemoteDataSourceHash() =>
    r'f37cdf1d80dca87e726246e8f62e5deed864c775';

/// See also [nutritionRemoteDataSource].
@ProviderFor(nutritionRemoteDataSource)
final nutritionRemoteDataSourceProvider =
    AutoDisposeProvider<NutritionRemoteDataSource>.internal(
  nutritionRemoteDataSource,
  name: r'nutritionRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nutritionRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NutritionRemoteDataSourceRef
    = AutoDisposeProviderRef<NutritionRemoteDataSource>;
String _$nutritionRepositoryHash() =>
    r'766815cf5d3654661a3158626711a005ac8920d0';

/// See also [nutritionRepository].
@ProviderFor(nutritionRepository)
final nutritionRepositoryProvider =
    AutoDisposeProvider<NutritionRepository>.internal(
  nutritionRepository,
  name: r'nutritionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nutritionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NutritionRepositoryRef = AutoDisposeProviderRef<NutritionRepository>;
String _$foodSearchHash() => r'fee555c36dfe957e0e228afbaa2b181691973624';

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

/// See also [foodSearch].
@ProviderFor(foodSearch)
const foodSearchProvider = FoodSearchFamily();

/// See also [foodSearch].
class FoodSearchFamily extends Family<AsyncValue<List<FoodItem>>> {
  /// See also [foodSearch].
  const FoodSearchFamily();

  /// See also [foodSearch].
  FoodSearchProvider call({
    required String query,
  }) {
    return FoodSearchProvider(
      query: query,
    );
  }

  @override
  FoodSearchProvider getProviderOverride(
    covariant FoodSearchProvider provider,
  ) {
    return call(
      query: provider.query,
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
  String? get name => r'foodSearchProvider';
}

/// See also [foodSearch].
class FoodSearchProvider extends AutoDisposeFutureProvider<List<FoodItem>> {
  /// See also [foodSearch].
  FoodSearchProvider({
    required String query,
  }) : this._internal(
          (ref) => foodSearch(
            ref as FoodSearchRef,
            query: query,
          ),
          from: foodSearchProvider,
          name: r'foodSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$foodSearchHash,
          dependencies: FoodSearchFamily._dependencies,
          allTransitiveDependencies:
              FoodSearchFamily._allTransitiveDependencies,
          query: query,
        );

  FoodSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<FoodItem>> Function(FoodSearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FoodSearchProvider._internal(
        (ref) => create(ref as FoodSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<FoodItem>> createElement() {
    return _FoodSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FoodSearchRef on AutoDisposeFutureProviderRef<List<FoodItem>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FoodSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<FoodItem>>
    with FoodSearchRef {
  _FoodSearchProviderElement(super.provider);

  @override
  String get query => (origin as FoodSearchProvider).query;
}

String _$barcodeLookupHash() => r'd72246f8eb845bb5c9d01d74e0e8125025b0b545';

/// See also [barcodeLookup].
@ProviderFor(barcodeLookup)
const barcodeLookupProvider = BarcodeLookupFamily();

/// See also [barcodeLookup].
class BarcodeLookupFamily extends Family<AsyncValue<FoodItem?>> {
  /// See also [barcodeLookup].
  const BarcodeLookupFamily();

  /// See also [barcodeLookup].
  BarcodeLookupProvider call({
    required String barcode,
  }) {
    return BarcodeLookupProvider(
      barcode: barcode,
    );
  }

  @override
  BarcodeLookupProvider getProviderOverride(
    covariant BarcodeLookupProvider provider,
  ) {
    return call(
      barcode: provider.barcode,
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
  String? get name => r'barcodeLookupProvider';
}

/// See also [barcodeLookup].
class BarcodeLookupProvider extends AutoDisposeFutureProvider<FoodItem?> {
  /// See also [barcodeLookup].
  BarcodeLookupProvider({
    required String barcode,
  }) : this._internal(
          (ref) => barcodeLookup(
            ref as BarcodeLookupRef,
            barcode: barcode,
          ),
          from: barcodeLookupProvider,
          name: r'barcodeLookupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$barcodeLookupHash,
          dependencies: BarcodeLookupFamily._dependencies,
          allTransitiveDependencies:
              BarcodeLookupFamily._allTransitiveDependencies,
          barcode: barcode,
        );

  BarcodeLookupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.barcode,
  }) : super.internal();

  final String barcode;

  @override
  Override overrideWith(
    FutureOr<FoodItem?> Function(BarcodeLookupRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BarcodeLookupProvider._internal(
        (ref) => create(ref as BarcodeLookupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        barcode: barcode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FoodItem?> createElement() {
    return _BarcodeLookupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BarcodeLookupProvider && other.barcode == barcode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, barcode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BarcodeLookupRef on AutoDisposeFutureProviderRef<FoodItem?> {
  /// The parameter `barcode` of this provider.
  String get barcode;
}

class _BarcodeLookupProviderElement
    extends AutoDisposeFutureProviderElement<FoodItem?> with BarcodeLookupRef {
  _BarcodeLookupProviderElement(super.provider);

  @override
  String get barcode => (origin as BarcodeLookupProvider).barcode;
}

String _$mealsForDateHash() => r'946a1186114c264e5b1d28ebf7ae0837b4b42276';

/// See also [mealsForDate].
@ProviderFor(mealsForDate)
const mealsForDateProvider = MealsForDateFamily();

/// See also [mealsForDate].
class MealsForDateFamily extends Family<AsyncValue<List<MealEntry>>> {
  /// See also [mealsForDate].
  const MealsForDateFamily();

  /// See also [mealsForDate].
  MealsForDateProvider call({
    required DateTime date,
  }) {
    return MealsForDateProvider(
      date: date,
    );
  }

  @override
  MealsForDateProvider getProviderOverride(
    covariant MealsForDateProvider provider,
  ) {
    return call(
      date: provider.date,
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
  String? get name => r'mealsForDateProvider';
}

/// See also [mealsForDate].
class MealsForDateProvider extends AutoDisposeFutureProvider<List<MealEntry>> {
  /// See also [mealsForDate].
  MealsForDateProvider({
    required DateTime date,
  }) : this._internal(
          (ref) => mealsForDate(
            ref as MealsForDateRef,
            date: date,
          ),
          from: mealsForDateProvider,
          name: r'mealsForDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mealsForDateHash,
          dependencies: MealsForDateFamily._dependencies,
          allTransitiveDependencies:
              MealsForDateFamily._allTransitiveDependencies,
          date: date,
        );

  MealsForDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<List<MealEntry>> Function(MealsForDateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MealsForDateProvider._internal(
        (ref) => create(ref as MealsForDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MealEntry>> createElement() {
    return _MealsForDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MealsForDateProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MealsForDateRef on AutoDisposeFutureProviderRef<List<MealEntry>> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _MealsForDateProviderElement
    extends AutoDisposeFutureProviderElement<List<MealEntry>>
    with MealsForDateRef {
  _MealsForDateProviderElement(super.provider);

  @override
  DateTime get date => (origin as MealsForDateProvider).date;
}

String _$waterForDateHash() => r'49d9ffd2d35c7c23c0e28937c755105166b58ec2';

/// See also [waterForDate].
@ProviderFor(waterForDate)
const waterForDateProvider = WaterForDateFamily();

/// See also [waterForDate].
class WaterForDateFamily extends Family<AsyncValue<List<WaterLog>>> {
  /// See also [waterForDate].
  const WaterForDateFamily();

  /// See also [waterForDate].
  WaterForDateProvider call({
    required DateTime date,
  }) {
    return WaterForDateProvider(
      date: date,
    );
  }

  @override
  WaterForDateProvider getProviderOverride(
    covariant WaterForDateProvider provider,
  ) {
    return call(
      date: provider.date,
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
  String? get name => r'waterForDateProvider';
}

/// See also [waterForDate].
class WaterForDateProvider extends AutoDisposeFutureProvider<List<WaterLog>> {
  /// See also [waterForDate].
  WaterForDateProvider({
    required DateTime date,
  }) : this._internal(
          (ref) => waterForDate(
            ref as WaterForDateRef,
            date: date,
          ),
          from: waterForDateProvider,
          name: r'waterForDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$waterForDateHash,
          dependencies: WaterForDateFamily._dependencies,
          allTransitiveDependencies:
              WaterForDateFamily._allTransitiveDependencies,
          date: date,
        );

  WaterForDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<List<WaterLog>> Function(WaterForDateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WaterForDateProvider._internal(
        (ref) => create(ref as WaterForDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<WaterLog>> createElement() {
    return _WaterForDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WaterForDateProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WaterForDateRef on AutoDisposeFutureProviderRef<List<WaterLog>> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _WaterForDateProviderElement
    extends AutoDisposeFutureProviderElement<List<WaterLog>>
    with WaterForDateRef {
  _WaterForDateProviderElement(super.provider);

  @override
  DateTime get date => (origin as WaterForDateProvider).date;
}

String _$dailySummaryHash() => r'c7caccba11e6c0d797d1acad6ee5ac89a42d34e2';

/// See also [dailySummary].
@ProviderFor(dailySummary)
const dailySummaryProvider = DailySummaryFamily();

/// See also [dailySummary].
class DailySummaryFamily extends Family<AsyncValue<DailySummary>> {
  /// See also [dailySummary].
  const DailySummaryFamily();

  /// See also [dailySummary].
  DailySummaryProvider call({
    required DateTime date,
  }) {
    return DailySummaryProvider(
      date: date,
    );
  }

  @override
  DailySummaryProvider getProviderOverride(
    covariant DailySummaryProvider provider,
  ) {
    return call(
      date: provider.date,
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
  String? get name => r'dailySummaryProvider';
}

/// See also [dailySummary].
class DailySummaryProvider extends AutoDisposeFutureProvider<DailySummary> {
  /// See also [dailySummary].
  DailySummaryProvider({
    required DateTime date,
  }) : this._internal(
          (ref) => dailySummary(
            ref as DailySummaryRef,
            date: date,
          ),
          from: dailySummaryProvider,
          name: r'dailySummaryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dailySummaryHash,
          dependencies: DailySummaryFamily._dependencies,
          allTransitiveDependencies:
              DailySummaryFamily._allTransitiveDependencies,
          date: date,
        );

  DailySummaryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<DailySummary> Function(DailySummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DailySummaryProvider._internal(
        (ref) => create(ref as DailySummaryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DailySummary> createElement() {
    return _DailySummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailySummaryProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DailySummaryRef on AutoDisposeFutureProviderRef<DailySummary> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _DailySummaryProviderElement
    extends AutoDisposeFutureProviderElement<DailySummary>
    with DailySummaryRef {
  _DailySummaryProviderElement(super.provider);

  @override
  DateTime get date => (origin as DailySummaryProvider).date;
}

String _$mealTemplatesHash() => r'ecd9853648fa1478ec356722f9df3a0325de1ecd';

/// See also [mealTemplates].
@ProviderFor(mealTemplates)
final mealTemplatesProvider =
    AutoDisposeFutureProvider<List<MealTemplate>>.internal(
  mealTemplates,
  name: r'mealTemplatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mealTemplatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MealTemplatesRef = AutoDisposeFutureProviderRef<List<MealTemplate>>;
String _$foodCategoriesHash() => r'a0ab614dbf0f4976d4b6e876bdc02fae1e2bfbc7';

/// See also [foodCategories].
@ProviderFor(foodCategories)
final foodCategoriesProvider =
    AutoDisposeFutureProvider<List<FoodCategory>>.internal(
  foodCategories,
  name: r'foodCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$foodCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FoodCategoriesRef = AutoDisposeFutureProviderRef<List<FoodCategory>>;
String _$logMealActionHash() => r'e7b1d98efb172fd796f91d71784b4ba9ef72e26c';

/// See also [logMealAction].
@ProviderFor(logMealAction)
const logMealActionProvider = LogMealActionFamily();

/// See also [logMealAction].
class LogMealActionFamily extends Family<AsyncValue<void>> {
  /// See also [logMealAction].
  const LogMealActionFamily();

  /// See also [logMealAction].
  LogMealActionProvider call({
    required MealEntry meal,
  }) {
    return LogMealActionProvider(
      meal: meal,
    );
  }

  @override
  LogMealActionProvider getProviderOverride(
    covariant LogMealActionProvider provider,
  ) {
    return call(
      meal: provider.meal,
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
  String? get name => r'logMealActionProvider';
}

/// See also [logMealAction].
class LogMealActionProvider extends AutoDisposeFutureProvider<void> {
  /// See also [logMealAction].
  LogMealActionProvider({
    required MealEntry meal,
  }) : this._internal(
          (ref) => logMealAction(
            ref as LogMealActionRef,
            meal: meal,
          ),
          from: logMealActionProvider,
          name: r'logMealActionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$logMealActionHash,
          dependencies: LogMealActionFamily._dependencies,
          allTransitiveDependencies:
              LogMealActionFamily._allTransitiveDependencies,
          meal: meal,
        );

  LogMealActionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.meal,
  }) : super.internal();

  final MealEntry meal;

  @override
  Override overrideWith(
    FutureOr<void> Function(LogMealActionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LogMealActionProvider._internal(
        (ref) => create(ref as LogMealActionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        meal: meal,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LogMealActionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LogMealActionProvider && other.meal == meal;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, meal.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LogMealActionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `meal` of this provider.
  MealEntry get meal;
}

class _LogMealActionProviderElement
    extends AutoDisposeFutureProviderElement<void> with LogMealActionRef {
  _LogMealActionProviderElement(super.provider);

  @override
  MealEntry get meal => (origin as LogMealActionProvider).meal;
}

String _$logWaterActionHash() => r'256631376cdcb9687487d25eacb265deaeb607e3';

/// See also [logWaterAction].
@ProviderFor(logWaterAction)
const logWaterActionProvider = LogWaterActionFamily();

/// See also [logWaterAction].
class LogWaterActionFamily extends Family<AsyncValue<void>> {
  /// See also [logWaterAction].
  const LogWaterActionFamily();

  /// See also [logWaterAction].
  LogWaterActionProvider call({
    required WaterLog waterLog,
  }) {
    return LogWaterActionProvider(
      waterLog: waterLog,
    );
  }

  @override
  LogWaterActionProvider getProviderOverride(
    covariant LogWaterActionProvider provider,
  ) {
    return call(
      waterLog: provider.waterLog,
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
  String? get name => r'logWaterActionProvider';
}

/// See also [logWaterAction].
class LogWaterActionProvider extends AutoDisposeFutureProvider<void> {
  /// See also [logWaterAction].
  LogWaterActionProvider({
    required WaterLog waterLog,
  }) : this._internal(
          (ref) => logWaterAction(
            ref as LogWaterActionRef,
            waterLog: waterLog,
          ),
          from: logWaterActionProvider,
          name: r'logWaterActionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$logWaterActionHash,
          dependencies: LogWaterActionFamily._dependencies,
          allTransitiveDependencies:
              LogWaterActionFamily._allTransitiveDependencies,
          waterLog: waterLog,
        );

  LogWaterActionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.waterLog,
  }) : super.internal();

  final WaterLog waterLog;

  @override
  Override overrideWith(
    FutureOr<void> Function(LogWaterActionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LogWaterActionProvider._internal(
        (ref) => create(ref as LogWaterActionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        waterLog: waterLog,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LogWaterActionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LogWaterActionProvider && other.waterLog == waterLog;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, waterLog.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LogWaterActionRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `waterLog` of this provider.
  WaterLog get waterLog;
}

class _LogWaterActionProviderElement
    extends AutoDisposeFutureProviderElement<void> with LogWaterActionRef {
  _LogWaterActionProviderElement(super.provider);

  @override
  WaterLog get waterLog => (origin as LogWaterActionProvider).waterLog;
}

String _$nutritionGoalsHash() => r'b674f5b25075a2d105eb78b171679b711b44aba7';

/// See also [nutritionGoals].
@ProviderFor(nutritionGoals)
final nutritionGoalsProvider =
    AutoDisposeFutureProvider<NutritionGoals>.internal(
  nutritionGoals,
  name: r'nutritionGoalsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nutritionGoalsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NutritionGoalsRef = AutoDisposeFutureProviderRef<NutritionGoals>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
