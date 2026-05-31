// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressPhotoModelImpl _$$ProgressPhotoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProgressPhotoModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: json['date'] as String,
      frontUrl: json['frontUrl'] as String?,
      sideUrl: json['sideUrl'] as String?,
      backUrl: json['backUrl'] as String?,
    );

Map<String, dynamic> _$$ProgressPhotoModelImplToJson(
        _$ProgressPhotoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date,
      'frontUrl': instance.frontUrl,
      'sideUrl': instance.sideUrl,
      'backUrl': instance.backUrl,
    };
