import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/food_category.dart';
import '../providers/nutrition_providers.dart';
import '../widgets/food_search_tile.dart';

class FoodDatabaseScreen extends ConsumerStatefulWidget {
  const FoodDatabaseScreen({super.key});

  @override
  ConsumerState<FoodDatabaseScreen> createState() =>
      _FoodDatabaseScreenState();
}

class _FoodDatabaseScreenState extends ConsumerState<FoodDatabaseScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(foodCategoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Database'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search foods...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
              ),
              onChanged: (v) => setState(() => _searchQuery = v),
            ),
          ),
          Expanded(
            child: _searchQuery.isNotEmpty
                ? ref.watch(foodSearchProvider(query: _searchQuery)).when(
                      data: (foods) => ListView.builder(
                        itemCount: foods.length,
                        itemBuilder: (context, index) {
                          final food = foods[index];
                          return FoodSearchTile(foodItem: food);
                        },
                      ),
                      loading: () => const Center(
                          child: CircularProgressIndicator()),
                      error: (e, _) => Center(child: Text('Error: $e')),
                    )
                : categoriesAsync.when(
                      data: (categories) => _buildCategories(categories),
                      loading: () => const Center(
                          child: CircularProgressIndicator()),
                      error: (e, _) => Center(child: Text('Error: $e')),
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(List<FoodCategory> categories) {
    if (categories.isEmpty) {
      return const Center(
        child: Text(
          'No categories available',
          style: TextStyle(color: Colors.white54, fontFamily: 'Poppins'),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            // TODO: Show foods in this category
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getCategoryIcon(category.icon),
                  size: 32,
                  color: _getCategoryColor(index),
                ),
                const SizedBox(height: 8),
                Text(
                  category.nameEn,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  IconData _getCategoryIcon(String? icon) {
    switch (icon) {
      case 'fruits':
        return Icons.apple_rounded;
      case 'vegetables':
        return Icons.eco_rounded;
      case 'dairy':
        return Icons.egg_rounded;
      case 'meat':
        return Icons.grass_rounded;
      case 'grains':
        return Icons.grain_rounded;
      case 'seafood':
        return Icons.set_meal_rounded;
      default:
        return Icons.restaurant_rounded;
    }
  }

  Color _getCategoryColor(int index) {
    final colors = [
      const Color(0xFFFF6D00),
      const Color(0xFF40C4FF),
      const Color(0xFFCE93D8),
      const Color(0xFFEF5350),
      const Color(0xFF00E676),
      const Color(0xFFFFEB3B),
    ];
    return colors[index % colors.length];
  }
}
