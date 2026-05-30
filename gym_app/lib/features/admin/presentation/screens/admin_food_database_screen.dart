import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/admin_providers.dart';

class AdminFoodDatabaseScreen extends ConsumerStatefulWidget {
  const AdminFoodDatabaseScreen({super.key});

  @override
  ConsumerState<AdminFoodDatabaseScreen> createState() => _AdminFoodDatabaseScreenState();
}

class _AdminFoodDatabaseScreenState extends ConsumerState<AdminFoodDatabaseScreen> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final TextEditingController _proteinController = TextEditingController();
  final TextEditingController _carbsController = TextEditingController();
  final TextEditingController _fatController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    _nameController.dispose();
    _caloriesController.dispose();
    _proteinController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    super.dispose();
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text(
          'Add Food Item',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'Poppins',
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dialogField(_nameController, 'Food Name'),
              _dialogField(_caloriesController, 'Calories (per 100g)'),
              _dialogField(_proteinController, 'Protein (g)'),
              _dialogField(_carbsController, 'Carbs (g)'),
              _dialogField(_fatController, 'Fat (g)'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final name = _nameController.text.trim();
              if (name.isEmpty) return;
              ref.read(adminFoodDatabaseProvider.notifier).addFoodItem({
                'name': name,
                'calories': int.tryParse(_caloriesController.text) ?? 0,
                'proteinG': int.tryParse(_proteinController.text) ?? 0,
                'carbsG': int.tryParse(_carbsController.text) ?? 0,
                'fatG': int.tryParse(_fatController.text) ?? 0,
                'createdAt': DateTime.now().toIso8601String(),
              });
              _nameController.clear();
              _caloriesController.clear();
              _proteinController.clear();
              _carbsController.clear();
              _fatController.clear();
              Navigator.pop(ctx);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Widget _dialogField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontFamily: 'Poppins',
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: AppColors.textSecondary,
            fontFamily: 'Poppins',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          filled: true,
          fillColor: AppColors.surfaceLight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final foodAsync = ref.watch(adminFoodDatabaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Database'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: _showAddDialog,
          ),
          IconButton(
            icon: const Icon(Icons.upload_file_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
              ),
              decoration: InputDecoration(
                hintText: 'Search food...',
                hintStyle: const TextStyle(
                  color: AppColors.textHint,
                  fontFamily: 'Poppins',
                ),
                prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textSecondary),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded, color: AppColors.textSecondary),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                filled: true,
                fillColor: AppColors.surface,
              ),
              onChanged: (value) => setState(() => _searchQuery = value.toLowerCase()),
            ),
          ),
          Expanded(
            child: foodAsync.when(
              data: (foods) {
                final filtered = foods.where((item) {
                  if (_searchQuery.isEmpty) return true;
                  final name = (item['name'] as String? ?? '').toLowerCase();
                  return name.contains(_searchQuery);
                }).toList();

                if (filtered.isEmpty) {
                  return const Center(
                    child: Text(
                      'No food items found',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];
                    final name = item['name'] as String? ?? '';
                    final calories = item['calories'] as int? ?? 0;
                    final protein = item['proteinG'] as int? ?? 0;
                    final carbs = item['carbsG'] as int? ?? 0;
                    final fat = item['fatG'] as int? ?? 0;
                    final id = item['id'] as String? ?? '';

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        title: Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        subtitle: Text(
                          '$calories kcal | P: ${protein}g C: ${carbs}g F: ${fat}g',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_rounded, color: AppColors.error),
                          onPressed: () {
                            ref.read(adminFoodDatabaseProvider.notifier).deleteFoodItem(id);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
