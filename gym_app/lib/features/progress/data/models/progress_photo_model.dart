import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/progress_photo.dart';

part 'progress_photo_model.freezed.dart';
part 'progress_photo_model.g.dart';

@freezed
class ProgressPhotoModel with _$ProgressPhotoModel {
  const factory ProgressPhotoModel({
    required String id,
    required String userId,
    required String date,
    String? frontUrl,
    String? sideUrl,
    String? backUrl,
  }) = _ProgressPhotoModel;

  factory ProgressPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressPhotoModelFromJson(json);

  factory ProgressPhotoModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProgressPhotoModel.fromJson({...data, 'id': doc.id});
  }

  factory ProgressPhotoModel.fromDomain(ProgressPhoto p) => ProgressPhotoModel(
        id: p.id,
        userId: p.userId,
        date: p.date.toIso8601String(),
        frontUrl: p.frontUrl,
        sideUrl: p.sideUrl,
        backUrl: p.backUrl,
      );
}

extension ProgressPhotoModelX on ProgressPhotoModel {
  Map<String, dynamic> toFirestore() => toJson()..remove('id');

  ProgressPhoto toDomain() => ProgressPhoto(
        id: id,
        userId: userId,
        date: DateTime.parse(date),
        frontUrl: frontUrl,
        sideUrl: sideUrl,
        backUrl: backUrl,
      );
}
