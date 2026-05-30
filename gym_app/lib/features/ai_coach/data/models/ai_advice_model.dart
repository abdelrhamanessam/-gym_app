import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/ai_advice.dart';

extension AiAdviceModel on AiAdvice {
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'date': date.toIso8601String(),
      'type': type.name,
      'title': title,
      'message': message,
      'actionItems': actionItems,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  static AiAdvice fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AiAdvice(
      id: doc.id,
      userId: data['userId'] as String? ?? '',
      date: DateTime.parse(data['date'] as String),
      type: AdviceType.values.firstWhere(
        (e) => e.name == data['type'],
        orElse: () => AdviceType.general,
      ),
      title: data['title'] as String? ?? '',
      message: data['message'] as String? ?? '',
      actionItems: List<String>.from(data['actionItems'] as List? ?? []),
      createdAt: DateTime.parse(data['createdAt'] as String),
    );
  }
}
