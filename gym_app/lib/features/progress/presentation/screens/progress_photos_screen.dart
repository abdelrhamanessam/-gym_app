import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/widgets/loading_widget.dart';
import 'package:gym_app/core/widgets/error_widget.dart';
import '../../domain/entities/progress_photo.dart';
import '../../domain/repositories/progress_repository.dart';
import '../providers/progress_providers.dart';

part 'progress_photos_screen.g.dart';

class ProgressPhotosScreen extends ConsumerWidget {
  const ProgressPhotosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosAsync = ref.watch(progressPhotosProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Progress Photos'),
        actions: [
          if (photosAsync.valueOrNull != null &&
              photosAsync.valueOrNull!.length >= 2)
            TextButton.icon(
              onPressed: () {
                final photos = photosAsync.valueOrNull!;
                context.push('/progress/before-after', extra: photos);
              },
              icon: const Icon(Icons.compare_arrows_rounded),
              label: const Text('Compare'),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addPhoto(context, ref),
        icon: const Icon(Icons.camera_alt_rounded),
        label: const Text('Add Photos'),
      ),
      body: photosAsync.when(
        loading: () => const LoadingScreen(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(progressPhotosProvider),
        ),
        data: (photos) {
          if (photos.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.photo_camera_rounded,
              title: 'No Photos Yet',
              message: 'Take progress photos to see your transformation!',
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemCount: photos.length,
            itemBuilder: (_, i) => _PhotoCard(
              photo: photos[i],
              onTap: () => _viewPhoto(context, photos[i]),
            ),
          );
        },
      ),
    );
  }

  void _addPhoto(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Add Progress Photos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            ListTile(
              leading:
                  const Icon(Icons.camera_alt_rounded, color: AppColors.primary),
              title: const Text('Take Photos'),
              onTap: () {
                Navigator.pop(ctx);
                _capturePhoto(context, ref, ImageSource.camera);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.photo_library_rounded, color: AppColors.primary),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(ctx);
                _capturePhoto(context, ref, ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _capturePhoto(
      BuildContext context, WidgetRef ref, ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source);
    if (picked == null) return;

    final photo = ProgressPhoto(
      id: const Uuid().v4(),
      userId: '',
      date: DateTime.now(),
      frontUrl: picked.path,
    );
    await ref.read(addPhotoProvider(photo).future);
    ref.invalidate(progressPhotosProvider);
  }

  void _viewPhoto(BuildContext context, ProgressPhoto photo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _PhotoViewScreen(photo: photo),
      ),
    );
  }
}

class _PhotoCard extends StatelessWidget {
  final ProgressPhoto photo;
  final VoidCallback onTap;

  const _PhotoCard({required this.photo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final url = photo.frontUrl ?? photo.sideUrl ?? photo.backUrl;
    final dateStr = DateFormat('MMM d, yyyy').format(photo.date);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: url != null && url.startsWith('http')
                    ? CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (_, __) => Container(
                          color: AppColors.surfaceLight,
                          child: const Center(
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: AppColors.primary),
                          ),
                        ),
                        errorWidget: (_, __, ___) => Container(
                          color: AppColors.surfaceLight,
                          child: const Icon(Icons.broken_image_rounded,
                              color: AppColors.textHint),
                        ),
                      )
                    : url != null
                        ? Image.file(
                            File(url),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (_, __, ___) => Container(
                              color: AppColors.surfaceLight,
                              child: const Icon(Icons.broken_image_rounded,
                                  color: AppColors.textHint),
                            ),
                          )
                        : Container(
                            color: AppColors.surfaceLight,
                            child: const Icon(Icons.person_rounded,
                                color: AppColors.textHint, size: 40),
                          ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                dateStr,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoViewScreen extends StatelessWidget {
  final ProgressPhoto photo;

  const _PhotoViewScreen({required this.photo});

  @override
  Widget build(BuildContext context) {
    final url = photo.frontUrl ?? photo.sideUrl ?? photo.backUrl;
    final dateStr = DateFormat('MMMM d, yyyy').format(photo.date);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(dateStr),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: url != null && url.startsWith('http')
            ? CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.contain,
                placeholder: (_, __) => const CircularProgressIndicator(
                    color: AppColors.primary),
                errorWidget: (_, __, ___) => const Icon(
                    Icons.broken_image_rounded,
                    color: AppColors.textHint,
                    size: 64),
              )
            : url != null
                ? Image.file(File(url), fit: BoxFit.contain)
                : const Icon(Icons.person_rounded,
                    color: AppColors.textHint, size: 64),
      ),
    );
  }
}

@riverpod
Future<void> addPhoto(
    AddPhotoRef ref, ProgressPhoto photo) async {
  final repo = ref.watch(progressRepositoryProvider);
  await repo.addProgressPhoto(photo);
}
