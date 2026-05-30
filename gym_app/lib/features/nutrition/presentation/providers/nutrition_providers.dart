import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../data/datasources/nutrition_remote_datasource.dart';
import '../../data/repositories/nutrition_repository_impl.dart';
import '../../domain/entities/daily_summary.dart';
import '../../domain/entities/food_category.dart';
import '../../domain/entities/food_item.dart';
import '../../domain/entities/meal_entry.dart';
import '../../domain/entities/meal_food_item.dart';
import '../../domain/entities/meal_template.dart';
import '../../domain/entities/nutrition_goals.dart';
import '../../domain/entities/water_log.dart';
import '../../domain/repositories/nutrition_repository.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

part 'nutrition_providers.g.dart';

@riverpod
NutritionRemoteDataSource nutritionRemoteDataSource(
    NutritionRemoteDataSourceRef ref) {
  return NutritionRemoteDataSource(firestore: ref.watch(firestoreProvider));
}

@riverpod
NutritionRepository nutritionRepository(NutritionRepositoryRef ref) {
  return NutritionRepositoryImpl(ref.watch(nutritionRemoteDataSourceProvider));
}

@riverpod
Future<List<FoodItem>> foodSearch(FoodSearchRef ref, {required String query}) async {
  if (query.trim().isEmpty) return [];
  final repository = ref.watch(nutritionRepositoryProvider);
  return repository.searchFoods(query);
}

@riverpod
Future<FoodItem?> barcodeLookup(BarcodeLookupRef ref,
    {required String barcode}) async {
  if (barcode.trim().isEmpty) return null;
  final repository = ref.watch(nutritionRepositoryProvider);
  return repository.getFoodByBarcode(barcode);
}

@riverpod
Future<List<MealEntry>> mealsForDate(MealsForDateRef ref,
    {required DateTime date}) async {
  final authUser = ref.watch(authStateProvider).valueOrNull;
  if (authUser == null) return [];
  final repository = ref.watch(nutritionRepositoryProvider);
  return repository.getMealsForDate(authUser.uid, date);
}

@riverpod
Future<List<WaterLog>> waterForDate(WaterForDateRef ref,
    {required DateTime date}) async {
  final authUser = ref.watch(authStateProvider).valueOrNull;
  if (authUser == null) return [];
  final repository = ref.watch(nutritionRepositoryProvider);
  return repository.getWaterLogsForDate(authUser.uid, date);
}

@riverpod
Future<DailySummary> dailySummary(DailySummaryRef ref,
    {required DateTime date}) async {
  final authUser = ref.watch(authStateProvider).valueOrNull;
  if (authUser == null) {
    throw Exception('User not authenticated');
  }
  final repository = ref.watch(nutritionRepositoryProvider);
  final existing = await repository.getDailySummary(authUser.uid, date);
  if (existing != null) return existing;
  final newSummary = DailySummary(
    id: const Uuid().v4(),
    userId: authUser.uid,
    date: DateTime(date.year, date.month, date.day),
    createdAt: DateTime.now(),
  );
  await repository.saveDailySummary(newSummary);
  return newSummary;
}

@riverpod
Future<List<MealTemplate>> mealTemplates(MealTemplatesRef ref) async {
  final authUser = ref.watch(authStateProvider).valueOrNull;
  if (authUser == null) return [];
  final repository = ref.watch(nutritionRepositoryProvider);
  return repository.getMealTemplates(authUser.uid);
}

@riverpod
Future<List<FoodCategory>> foodCategories(FoodCategoriesRef ref) async {
  final repository = ref.watch(nutritionRepositoryProvider);
  return repository.getFoodCategories();
}

@riverpod
Future<void> logMealAction(LogMealActionRef ref,
    {required MealEntry meal}) async {
  final repository = ref.watch(nutritionRepositoryProvider);
  await repository.logMeal(meal);
}

@riverpod
Future<void> logWaterAction(LogWaterActionRef ref,
    {required WaterLog waterLog}) async {
  final repository = ref.watch(nutritionRepositoryProvider);
  await repository.logWater(waterLog);
}

@riverpod
Future<NutritionGoals> nutritionGoals(NutritionGoalsRef ref) async {
  final authUser = ref.watch(authStateProvider).valueOrNull;
  if (authUser == null) {
    return const NutritionGoals(
      dailyCalories: 2500,
      dailyProtein: 175,
      dailyCarbs: 250,
      dailyFat: 55,
      dailyWaterMl: 3000,
    );
  }
  final repository = ref.watch(nutritionRepositoryProvider);
  return repository.getNutritionGoals(authUser.uid);
}
