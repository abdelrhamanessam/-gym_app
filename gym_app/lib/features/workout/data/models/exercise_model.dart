import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/exercise.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
class ExerciseModel with _$ExerciseModel {
  const factory ExerciseModel({
    required String id,
    required String name,
    required String muscleGroup,
    @Default([]) List<String> instructions,
    @Default([]) List<String> commonMistakes,
    required String difficulty,
    String? imageUrl,
    @Default([]) List<String> equipment,
    @Default(false) bool isCardio,
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  factory ExerciseModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ExerciseModel.fromJson({...data, 'id': doc.id});
  }

}

extension ExerciseModelX on ExerciseModel {
  Map<String, dynamic> toFirestore() => toJson()..remove('id');

  Exercise toDomain() => Exercise(
        id: id,
        name: name,
        muscleGroup: MuscleGroup.values.byName(muscleGroup),
        instructions: instructions,
        commonMistakes: commonMistakes,
        difficulty: Difficulty.values.byName(difficulty),
        imageUrl: imageUrl,
        equipment: equipment,
        isCardio: isCardio,
      );
}
