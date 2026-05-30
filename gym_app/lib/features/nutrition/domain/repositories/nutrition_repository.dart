import '../entities/daily_summary.dart';
import '../entities/food_category.dart';
import '../entities/food_item.dart';
import '../entities/food_log.dart';
import '../entities/meal_entry.dart';
import '../entities/meal_template.dart';
import '../entities/nutrition_goals.dart';
import '../entities/water_log.dart';

abstract class NutritionRepository {
  Future<List<FoodItem>> searchFoods(String query);
  Future<FoodItem?> getFoodByBarcode(String barcode);
  Future<FoodItem?> getFoodById(String id);
  Future<void> addCustomFood(FoodItem foodItem);
  Future<void> logMeal(MealEntry mealEntry);
  Future<List<MealEntry>> getMealsForDate(String userId, DateTime date);
  Future<void> logWater(WaterLog waterLog);
  Future<List<WaterLog>> getWaterLogsForDate(String userId, DateTime date);
  Future<DailySummary?> getDailySummary(String userId, DateTime date);
  Future<void> saveDailySummary(DailySummary dailySummary);
  Future<List<MealTemplate>> getMealTemplates(String userId);
  Future<void> saveMealTemplate(MealTemplate mealTemplate);
  Future<List<FoodCategory>> getFoodCategories();
  Future<NutritionGoals> getNutritionGoals(String userId);
}
