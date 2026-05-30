import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/food_item.dart';
import '../providers/nutrition_providers.dart';
import '../widgets/food_search_tile.dart';

class FoodSearchScreen extends ConsumerStatefulWidget {
  const FoodSearchScreen({super.key});

  @override
  ConsumerState<FoodSearchScreen> createState() => _FoodSearchScreenState();
}

class _FoodSearchScreenState extends ConsumerState<FoodSearchScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showQuantityDialog(FoodItem foodItem) {
    final quantityController = TextEditingController(text: '100');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(foodItem.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity (g)',
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _nutrientRow('Calories',
                      ((foodItem.calories / foodItem.servingSizeG) * 100)
                          .toStringAsFixed(0)),
                  _nutrientRow('Protein',
                      '${((foodItem.proteinG / foodItem.servingSizeG) * 100).toStringAsFixed(1)}g'),
                  _nutrientRow('Carbs',
                      '${((foodItem.carbsG / foodItem.servingSizeG) * 100).toStringAsFixed(1)}g'),
                  _nutrientRow('Fat',
                      '${((foodItem.fatG / foodItem.servingSizeG) * 100).toStringAsFixed(1)}g'),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Add to meal
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added ${quantityController.text}g of ${foodItem.name}')),
              );
            },
            child: const Text('Add to Meal'),
          ),
        ],
      ),
    );
  }

  Widget _nutrientRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13)),
          Text(value, style: const TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Food'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
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
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
              ),
              onChanged: (v) => setState(() => _query = v),
              textInputAction: TextInputAction.search,
            ),
          ),
          Expanded(
            child: _query.isEmpty
                ? const Center(
                    child: Text(
                      'Search for foods by name',
                      style: TextStyle(color: Colors.white54, fontFamily: 'Poppins'),
                    ),
                  )
                : ref.watch(foodSearchProvider(query: _query)).when(
                      data: (foods) {
                        if (foods.isEmpty) {
                          return const Center(
                            child: Text(
                              'No foods found',
                              style: TextStyle(color: Colors.white54, fontFamily: 'Poppins'),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: foods.length,
                          itemBuilder: (context, index) {
                            final food = foods[index];
                            return FoodSearchTile(
                              foodItem: food,
                              onTap: () => _showQuantityDialog(food),
                            );
                          },
                        );
                      },
                      loading: () => const Center(
                          child: CircularProgressIndicator()),
                      error: (e, _) => Center(child: Text('Error: $e')),
                    ),
          ),
        ],
      ),
    );
  }
}
