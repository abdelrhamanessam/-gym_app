import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/utils/calculations.dart' as calc;
import '../../domain/entities/daily_summary.dart';
import '../../domain/entities/food_category.dart';
import '../../domain/entities/food_item.dart';
import '../../domain/entities/meal_entry.dart';
import '../../domain/entities/meal_food_item.dart';
import '../../domain/entities/meal_template.dart';
import '../../domain/entities/nutrition_goals.dart';
import '../../domain/entities/water_log.dart';
import '../../domain/repositories/nutrition_repository.dart';
import '../datasources/nutrition_remote_datasource.dart';

class NutritionRepositoryImpl implements NutritionRepository {
  final NutritionRemoteDataSource _remoteDataSource;
  final Uuid _uuid;

  NutritionRepositoryImpl(
    this._remoteDataSource, {
    Uuid? uuid,
  }) : _uuid = uuid ?? const Uuid();

  @override
  Future<List<FoodItem>> searchFoods(String query) async {
    final data = await _remoteDataSource.searchFoods(query);
    return data.map(_mapFoodItem).toList();
  }

  @override
  Future<FoodItem?> getFoodByBarcode(String barcode) async {
    final data = await _remoteDataSource.getFoodByBarcode(barcode);
    if (data == null) return null;
    return _mapFoodItem(data);
  }

  @override
  Future<FoodItem?> getFoodById(String id) async {
    final data = await _remoteDataSource.getFoodById(id);
    if (data == null) return null;
    return _mapFoodItem(data);
  }

  @override
  Future<void> addCustomFood(FoodItem foodItem) async {
    await _remoteDataSource.addCustomFood({
      'id': foodItem.id,
      'name': foodItem.name,
      'brand': foodItem.brand,
      'category': foodItem.category,
      'servingSizeG': foodItem.servingSizeG,
      'calories': foodItem.calories,
      'proteinG': foodItem.proteinG,
      'carbsG': foodItem.carbsG,
      'fatG': foodItem.fatG,
      'fiberG': foodItem.fiberG,
      'sugarG': foodItem.sugarG,
      'barcode': foodItem.barcode,
      'source': foodItem.source.name,
      'imageUrl': foodItem.imageUrl,
      'verified': false,
    });
  }

  @override
  Future<void> logMeal(MealEntry mealEntry) async {
    await _remoteDataSource.logMeal({
      'id': mealEntry.id,
      'userId': mealEntry.userId,
      'date': Timestamp.fromDate(mealEntry.date),
      'mealType': mealEntry.mealType.name,
      'foods': mealEntry.foods
          .map((f) => {
                'foodItem': f.foodItem.toJson(),
                'quantityG': f.quantityG,
              })
          .toList(),
      'totalCalories': mealEntry.totalCalories,
      'totalProtein': mealEntry.totalProtein,
      'totalCarbs': mealEntry.totalCarbs,
      'totalFat': mealEntry.totalFat,
      'imageUrl': mealEntry.imageUrl,
      'notes': mealEntry.notes,
      'createdAt': Timestamp.fromDate(mealEntry.createdAt),
    });
  }

  @override
  Future<List<MealEntry>> getMealsForDate(
      String userId, DateTime date) async {
    final data = await _remoteDataSource.getMealsForDate(userId, date);
    return data.map((json) {
      final foods = (json['foods'] as List<dynamic>?)
              ?.map((f) => MealFoodItem(
                    foodItem:
                        FoodItem.fromJson(f['foodItem'] as Map<String, dynamic>),
                    quantityG: (f['quantityG'] as num).toDouble(),
                  ))
              .toList() ??
          [];
      return MealEntry(
        id: json['id'] as String,
        userId: json['userId'] as String,
        date: (json['date'] as Timestamp).toDate(),
        mealType: _parseMealType(json['mealType'] as String),
        foods: foods,
        totalCalories: (json['totalCalories'] as num?)?.toDouble() ?? 0,
        totalProtein: (json['totalProtein'] as num?)?.toDouble() ?? 0,
        totalCarbs: (json['totalCarbs'] as num?)?.toDouble() ?? 0,
        totalFat: (json['totalFat'] as num?)?.toDouble() ?? 0,
        imageUrl: json['imageUrl'] as String?,
        notes: json['notes'] as String?,
        createdAt: (json['createdAt'] as Timestamp).toDate(),
      );
    }).toList();
  }

  @override
  Future<void> logWater(WaterLog waterLog) async {
    await _remoteDataSource.logWater({
      'id': waterLog.id,
      'userId': waterLog.userId,
      'date': Timestamp.fromDate(waterLog.date),
      'amountMl': waterLog.amountMl,
      'createdAt': Timestamp.fromDate(waterLog.createdAt),
    });
  }

  @override
  Future<List<WaterLog>> getWaterLogsForDate(
      String userId, DateTime date) async {
    final data = await _remoteDataSource.getWaterLogsForDate(userId, date);
    return data
        .map((json) => WaterLog(
              id: json['id'] as String,
              userId: json['userId'] as String,
              date: (json['date'] as Timestamp).toDate(),
              amountMl: (json['amountMl'] as num).toDouble(),
              createdAt: (json['createdAt'] as Timestamp).toDate(),
            ))
        .toList();
  }

  @override
  Future<DailySummary?> getDailySummary(String userId, DateTime date) async {
    final data = await _remoteDataSource.getDailySummary(userId, date);
    if (data == null) return null;
    return DailySummary(
      id: data['id'] as String,
      userId: data['userId'] as String,
      date: (data['date'] as Timestamp).toDate(),
      totalCalories: (data['totalCalories'] as num?)?.toDouble() ?? 0,
      totalProtein: (data['totalProtein'] as num?)?.toDouble() ?? 0,
      totalCarbs: (data['totalCarbs'] as num?)?.toDouble() ?? 0,
      totalFat: (data['totalFat'] as num?)?.toDouble() ?? 0,
      totalWaterMl: (data['totalWaterMl'] as num?)?.toDouble() ?? 0,
      workoutCompleted: data['workoutCompleted'] as bool? ?? false,
      aiReport: data['aiReport'] as String?,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  @override
  Future<void> saveDailySummary(DailySummary dailySummary) async {
    await _remoteDataSource.saveDailySummary({
      'id': dailySummary.id,
      'userId': dailySummary.userId,
      'date': Timestamp.fromDate(dailySummary.date),
      'totalCalories': dailySummary.totalCalories,
      'totalProtein': dailySummary.totalProtein,
      'totalCarbs': dailySummary.totalCarbs,
      'totalFat': dailySummary.totalFat,
      'totalWaterMl': dailySummary.totalWaterMl,
      'workoutCompleted': dailySummary.workoutCompleted,
      'aiReport': dailySummary.aiReport,
      'createdAt': Timestamp.fromDate(dailySummary.createdAt),
    });
  }

  @override
  Future<List<MealTemplate>> getMealTemplates(String userId) async {
    final data = await _remoteDataSource.getMealTemplates(userId);
    return data
        .map((json) => MealTemplate(
              id: json['id'] as String,
              userId: json['userId'] as String,
              name: json['name'] as String,
              mealType: json['mealType'] as String,
              foods: (json['foods'] as List<dynamic>?)
                      ?.map((f) => MealTemplateFood(
                            foodId: f['foodId'] as String,
                            foodName: f['foodName'] as String,
                            quantityG: (f['quantityG'] as num).toDouble(),
                          ))
                      .toList() ??
                  [],
              totalCalories: (json['totalCalories'] as num?)?.toDouble() ?? 0,
              createdAt: (json['createdAt'] as Timestamp).toDate(),
            ))
        .toList();
  }

  @override
  Future<void> saveMealTemplate(MealTemplate mealTemplate) async {
    await _remoteDataSource.saveMealTemplate({
      'id': mealTemplate.id,
      'userId': mealTemplate.userId,
      'name': mealTemplate.name,
      'mealType': mealTemplate.mealType,
      'foods': mealTemplate.foods
          .map((f) => {
                'foodId': f.foodId,
                'foodName': f.foodName,
                'quantityG': f.quantityG,
              })
          .toList(),
      'totalCalories': mealTemplate.totalCalories,
      'createdAt': Timestamp.fromDate(mealTemplate.createdAt),
    });
  }

  @override
  Future<List<FoodCategory>> getFoodCategories() async {
    final data = await _remoteDataSource.getFoodCategories();
    return data
        .map((json) => FoodCategory(
              id: json['id'] as String,
              nameEn: json['nameEn'] as String,
              nameAr: json['nameAr'] as String,
              icon: json['icon'] as String?,
              subcategories: (json['subcategories'] as List<dynamic>?)
                      ?.map((e) => e as String)
                      .toList() ??
                  [],
            ))
        .toList();
  }

  @override
  Future<NutritionGoals> getNutritionGoals(String userId) async {
    final profileData = await _remoteDataSource.getUserProfile(userId);
    if (profileData == null) {
      return const NutritionGoals(
        dailyCalories: 2500,
        dailyProtein: 175,
        dailyCarbs: 250,
        dailyFat: 55,
        dailyWaterMl: 3000,
      );
    }

    final weightKg = (profileData['weightKg'] as num?)?.toDouble() ?? 70.0;
    final heightCm = (profileData['heightCm'] as num?)?.toDouble() ?? 175.0;
    final age = (profileData['age'] as num?)?.toInt() ?? 25;
    final genderStr = (profileData['gender'] as String?) ?? 'male';
    final activityStr = (profileData['activityLevel'] as String?) ?? 'moderate';

    final gender =
        genderStr == 'male' ? calc.Gender.male : calc.Gender.female;
    final activityMap = {
      'sedentary': calc.ActivityLevel.sedentary,
      'light': calc.ActivityLevel.light,
      'moderate': calc.ActivityLevel.moderate,
      'active': calc.ActivityLevel.active,
      'veryActive': calc.ActivityLevel.veryActive,
    };
    final activityLevel = activityMap[activityStr] ?? calc.ActivityLevel.moderate;

    final bmr = calc.Calculations.bmrMifflinStJeor(
      weightKg: weightKg,
      heightCm: heightCm,
      age: age,
      gender: gender,
    );
    final tdee = calc.Calculations.tdee(bmr: bmr, activityLevel: activityLevel);
    final macros = calc.Calculations.calculateMacros(
      tdee: tdee,
      goal: calc.GoalType.maintain,
      weightKg: weightKg,
    );
    final waterL = calc.Calculations.waterIntakeLiters(weightKg: weightKg);

    return NutritionGoals(
      dailyCalories: macros.calories,
      dailyProtein: macros.proteinG,
      dailyCarbs: macros.carbsG,
      dailyFat: macros.fatG,
      dailyWaterMl: waterL * 1000,
    );
  }

  FoodItem _mapFoodItem(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      servingSizeG: (json['servingSizeG'] as num?)?.toDouble() ?? 100,
      calories: (json['calories'] as num).toDouble(),
      proteinG: (json['proteinG'] as num).toDouble(),
      carbsG: (json['carbsG'] as num).toDouble(),
      fatG: (json['fatG'] as num).toDouble(),
      fiberG: (json['fiberG'] as num?)?.toDouble() ?? 0,
      sugarG: (json['sugarG'] as num?)?.toDouble() ?? 0,
      barcode: json['barcode'] as String?,
      source: _parseFoodSource((json['source'] as String?) ?? 'custom'),
      imageUrl: json['imageUrl'] as String?,
      verified: json['verified'] as bool? ?? false,
    );
  }

  FoodSource _parseFoodSource(String value) {
    return FoodSource.values.firstWhere(
      (e) => e.name == value,
      orElse: () => FoodSource.custom,
    );
  }

  MealType _parseMealType(String value) {
    return MealType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => MealType.snack,
    );
  }
}
