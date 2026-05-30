import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/utils/validators.dart';
import '../../domain/entities/user_profile.dart';
import '../providers/auth_providers.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _bodyFatController = TextEditingController();
  String _gender = 'male';
  ActivityLevel _activityLevel = ActivityLevel.moderate;
  FitnessGoal _fitnessGoal = FitnessGoal.maintain;
  bool _isLoading = false;
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _bodyFatController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // TODO: Upload to Firebase Storage
    }
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    try {
      final authUser = ref.read(authStateProvider).valueOrNull;
      if (authUser == null) return;
      final profile = UserProfile(
        id: authUser.uid,
        email: authUser.email,
        name: _nameController.text.trim(),
        age: int.parse(_ageController.text.trim()),
        gender: _gender,
        heightCm: double.parse(_heightController.text.trim()),
        weightKg: double.parse(_weightController.text.trim()),
        bodyFatPercent: double.tryParse(_bodyFatController.text.trim()) ?? 0,
        activityLevel: _activityLevel,
        fitnessGoal: _fitnessGoal,
        photoUrl: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await ref.read(updateUserProfileProvider(
        uid: authUser.uid,
        profile: profile,
      ).future);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Future<void> _handleSignOut() async {
    setState(() => _isLoading = true);
    try {
      await ref.read(signOutActionProvider.future);
      if (mounted) context.go('/login');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _loadProfile(UserProfile profile) {
    _nameController.text = profile.name;
    _ageController.text = profile.age.toString();
    _heightController.text = profile.heightCm.toStringAsFixed(1);
    _weightController.text = profile.weightKg.toStringAsFixed(1);
    _bodyFatController.text = profile.bodyFatPercent.toStringAsFixed(1);
    _gender = profile.gender;
    _activityLevel = profile.activityLevel;
    _fitnessGoal = profile.fitnessGoal;
  }

  @override
  Widget build(BuildContext context) {
    final authUser = ref.watch(authStateProvider).valueOrNull;
    if (authUser == null) {
      return const Scaffold(body: Center(child: Text('Not authenticated')));
    }

    final profileAsync = ref.watch(userProfileProvider(uid: authUser.uid));

    return profileAsync.when(
      data: (profile) {
        if (!_nameController.text.isNotEmpty) _loadProfile(profile);
        return _buildProfileContent(profile);
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        body: Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _buildProfileContent(UserProfile profile) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: _isLoading ? null : _handleSignOut,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.surfaceLight,
                      backgroundImage: profile.photoUrl != null
                          ? NetworkImage(profile.photoUrl!)
                          : null,
                      child: profile.photoUrl == null
                          ? const Icon(Icons.person,
                              size: 50, color: AppColors.textSecondary)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 16,
                          color: AppColors.textOnPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                profile.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                profile.email,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person_outlined),
                ),
                validator: Validators.name,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  prefixIcon: Icon(Icons.cake_outlined),
                ),
                validator: Validators.age,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  prefixIcon: Icon(Icons.people_outlined),
                ),
                items: const [
                  DropdownMenuItem(value: 'male', child: Text('Male')),
                  DropdownMenuItem(value: 'female', child: Text('Female')),
                ],
                onChanged: (v) => setState(() => _gender = v ?? 'male'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Height (cm)',
                  prefixIcon: Icon(Icons.height),
                ),
                validator: Validators.height,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  prefixIcon: Icon(Icons.monitor_weight_outlined),
                ),
                validator: Validators.weight,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bodyFatController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Body Fat %',
                  prefixIcon: Icon(Icons.percent),
                ),
                validator: Validators.positiveNumber,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<ActivityLevel>(
                value: _activityLevel,
                decoration: const InputDecoration(
                  labelText: 'Activity Level',
                  prefixIcon: Icon(Icons.directions_run),
                ),
                items: const [
                  DropdownMenuItem(
                      value: ActivityLevel.sedentary,
                      child: Text('Sedentary')),
                  DropdownMenuItem(
                      value: ActivityLevel.light, child: Text('Light')),
                  DropdownMenuItem(
                      value: ActivityLevel.moderate,
                      child: Text('Moderate')),
                  DropdownMenuItem(
                      value: ActivityLevel.active, child: Text('Active')),
                  DropdownMenuItem(
                      value: ActivityLevel.veryActive,
                      child: Text('Very Active')),
                ],
                onChanged: (v) =>
                    setState(() => _activityLevel = v ?? ActivityLevel.moderate),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<FitnessGoal>(
                value: _fitnessGoal,
                decoration: const InputDecoration(
                  labelText: 'Fitness Goal',
                  prefixIcon: Icon(Icons.flag_outlined),
                ),
                items: const [
                  DropdownMenuItem(
                      value: FitnessGoal.fatLoss, child: Text('Fat Loss')),
                  DropdownMenuItem(
                      value: FitnessGoal.muscleGain,
                      child: Text('Muscle Gain')),
                  DropdownMenuItem(
                      value: FitnessGoal.recomposition,
                      child: Text('Recomposition')),
                  DropdownMenuItem(
                      value: FitnessGoal.maintain, child: Text('Maintain')),
                ],
                onChanged: (v) =>
                    setState(() => _fitnessGoal = v ?? FitnessGoal.maintain),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [AppColors.gradientStart, AppColors.gradientEnd],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: _isSaving ? null : _handleSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.textOnPrimary,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: _isSaving
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.textOnPrimary,
                            ),
                          )
                        : const Text(
                            'Save Changes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: _isLoading ? null : _handleSignOut,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.error),
                    foregroundColor: AppColors.error,
                  ),
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text('Sign Out'),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
