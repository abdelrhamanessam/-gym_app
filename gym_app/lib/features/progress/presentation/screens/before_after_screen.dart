import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import '../../../core/theme/app_colors.dart';
import '../../domain/entities/progress_photo.dart';
import '../widgets/comparison_slider.dart';

class BeforeAfterScreen extends StatefulWidget {
  final List<ProgressPhoto> photos;

  const BeforeAfterScreen({super.key, required this.photos});

  @override
  State<BeforeAfterScreen> createState() => _BeforeAfterScreenState();
}

class _BeforeAfterScreenState extends State<BeforeAfterScreen> {
  late ProgressPhoto _before;
  late ProgressPhoto _after;

  @override
  void initState() {
    super.initState();
    _after = widget.photos.first;
    _before = widget.photos.last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Compare'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: _PhotoPicker(
                    label: 'Before',
                    photo: _before,
                    photos: widget.photos,
                    onSelected: (p) => setState(() => _before = p),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _PhotoPicker(
                    label: 'After',
                    photo: _after,
                    photos: widget.photos,
                    onSelected: (p) => setState(() => _after = p),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ComparisonSlider(
                before: _buildPhotoWidget(_before),
                after: _buildPhotoWidget(_after),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPhotoWidget(ProgressPhoto photo) {
    final url = photo.frontUrl ?? photo.sideUrl ?? photo.backUrl;
    if (url == null) {
      return Container(
        color: AppColors.surfaceLight,
        child: const Center(
          child: Icon(Icons.person_rounded,
              color: AppColors.textHint, size: 48),
        ),
      );
    }
    if (url.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
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
              color: AppColors.textHint, size: 48),
        ),
      );
    }
    return Image.file(
      File(url),
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        color: AppColors.surfaceLight,
        child:
            const Icon(Icons.broken_image_rounded, color: AppColors.textHint, size: 48),
      ),
    );
  }
}

class _PhotoPicker extends StatelessWidget {
  final String label;
  final ProgressPhoto photo;
  final List<ProgressPhoto> photos;
  final ValueChanged<ProgressPhoto> onSelected;

  const _PhotoPicker({
    required this.label,
    required this.photo,
    required this.photos,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (ctx) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Select $label Photo',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                ...photos.map((p) => ListTile(
                      leading: const Icon(Icons.photo_rounded,
                          color: AppColors.primary),
                      title: Text(
                        '${label} - ${photo.date.day}/${photo.date.month}/${photo.date.year}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      selected: p.id == photo.id,
                      onTap: () {
                        onSelected(p);
                        Navigator.pop(ctx);
                      },
                    )),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_library_rounded,
                color: AppColors.primary, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
