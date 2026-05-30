import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_photo.freezed.dart';
part 'progress_photo.g.dart';

@freezed
class ProgressPhoto with _$ProgressPhoto {
  const factory ProgressPhoto({
    required String id,
    required String userId,
    required DateTime date,
    String? frontUrl,
    String? sideUrl,
    String? backUrl,
  }) = _ProgressPhoto;

  factory ProgressPhoto.fromJson(Map<String, dynamic> json) =>
      _$ProgressPhotoFromJson(json);
}
