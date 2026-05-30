import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/meal_entry.dart';
import '../../domain/entities/meal_food_item.dart';
import '../../domain/entities/food_item.dart';
import '../providers/nutrition_providers.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

class AddMealScreen extends ConsumerStatefulWidget {
  const AddMealScreen({super.key});

  @override
  ConsumerState<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends ConsumerState<AddMealScreen> {
  final _nameController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _carbsController = TextEditingController();
  final _fatController = TextEditingController();
  String _mealType = 'snack';
  bool _isSaving = false;

  final _mealTypes = ['breakfast', 'lunch', 'dinner', 'snack'];

  @override
  void dispose() {
    _nameController.dispose();
    _caloriesController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (_nameController.text.trim().isEmpty) return;
    setState(() => _isSaving = true);

    try {
      final authUser = ref.read(authStateProvider).valueOrNull;
      if (authUser == null) return;

      final foodItem = FoodItem(
        id: const Uuid().v4(),
        name: _nameController.text.trim(),
        servingSizeG: 100,
        calories: double.tryParse(_caloriesController.text) ?? 0,
        proteinG: double.tryParse(_proteinController.text) ?? 0,
        carbsG: double.tryParse(_carbsController.text) ?? 0,
        fatG: double.tryParse(_fatController.text) ?? 0,
      );

      final mealFood = MealFoodItem(foodItem: foodItem, quantityG: 100);
      final meal = MealEntry(
        id: const Uuid().v4(),
        userId: authUser.uid,
        date: DateTime.now(),
        mealType: _parseMealType(_mealType),
        foods: [mealFood],
        totalCalories: mealFood.calculatedCalories,
        totalProtein: mealFood.calculatedProtein,
        totalCarbs: mealFood.calculatedCarbs,
        totalFat: mealFood.calculatedFat,
        createdAt: DateTime.now(),
      );

      await ref.read(logMealActionProvider(meal: meal).future);
      ref.invalidate(mealsForDateProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Meal logged successfully')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  MealType _parseMealType(String value) {
    return MealType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => MealType.snack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Meal'),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: _isSaving ? null : _handleSave,
            child: _isSaving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _mealType,
              decoration: const InputDecoration(
                labelText: 'Meal Type',
                prefixIcon: Icon(Icons.restaurant_menu_rounded),
              ),
              items: _mealTypes
                  .map((t) => DropdownMenuItem(
                      value: t,
                      child: Text(t[0].toUpperCase() + t.substring(1))))
                  .toList(),
              onChanged: (v) => setState(() => _mealType = v ?? 'snack'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Food Name',
                prefixIcon: Icon(Icons.restaurant_rounded),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Nutrition per 100g',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _caloriesController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Calories',
                      prefixIcon: Icon(Icons.local_fire_department_rounded,
                          color: Color(0xFFFF6D00), size: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _proteinController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Protein (g)',
                      prefixIcon: Icon(Icons.fitness_center_rounded,
                          color: Color(0xFF40C4FF), size: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _carbsController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Carbs (g)',
                      prefixIcon: Icon(Icons.grain_rounded,
                          color: Color(0xFFCE93D8), size: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _fatController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Fat (g)',
                      prefixIcon: Icon(Icons.opacity_rounded,
                          color: Color(0xFFEF5350), size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
