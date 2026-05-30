import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import '../providers/admin_providers.dart';

class AdminWorkoutScreen extends ConsumerStatefulWidget {
  const AdminWorkoutScreen({super.key});

  @override
  ConsumerState<AdminWorkoutScreen> createState() => _AdminWorkoutScreenState();
}

class _AdminWorkoutScreenState extends ConsumerState<AdminWorkoutScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text(
          'Add Program',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'Poppins',
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
              ),
              decoration: InputDecoration(
                labelText: 'Program Name',
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
            const SizedBox(height: 12),
            TextField(
              controller: _descController,
              maxLines: 3,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
              ),
              decoration: InputDecoration(
                labelText: 'Description',
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
          ],
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
              ref.read(adminWorkoutProgramsProvider.notifier).addProgram({
                'name': name,
                'description': _descController.text.trim(),
                'exercises': [],
                'createdAt': DateTime.now().toIso8601String(),
              });
              _nameController.clear();
              _descController.clear();
              Navigator.pop(ctx);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final programsAsync = ref.watch(adminWorkoutProgramsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Programs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: _showAddDialog,
          ),
        ],
      ),
      body: programsAsync.when(
        data: (programs) {
          if (programs.isEmpty) {
            return const Center(
              child: Text(
                'No programs yet',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontFamily: 'Poppins',
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: programs.length,
            itemBuilder: (context, index) {
              final program = programs[index];
              final name = program['name'] as String? ?? '';
              final desc = program['description'] as String? ?? '';
              final exercises = program['exercises'] as List<dynamic>? ?? [];
              final id = program['id'] as String? ?? '';

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.fitness_center_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  title: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  subtitle: Text(
                    '${exercises.length} exercises',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit_rounded,
                          color: AppColors.info,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: AppColors.error,
                          size: 20,
                        ),
                        onPressed: () {
                          ref.read(adminWorkoutProgramsProvider.notifier).deleteProgram(id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
