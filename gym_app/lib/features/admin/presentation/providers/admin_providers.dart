import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gym_app/core/constants/firebase_constants.dart';

part 'admin_providers.g.dart';

@riverpod
class AdminUsersProvider extends _$AdminUsersProvider {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseConstants.usersCollection)
        .orderBy('createdAt', descending: true)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  Future<void> banUser(String userId) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .update({'isBanned': true, 'updatedAt': DateTime.now().toIso8601String()});
    ref.invalidateSelf();
  }

  Future<void> deleteUser(String userId) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.usersCollection)
        .doc(userId)
        .delete();
    ref.invalidateSelf();
  }
}

@riverpod
class AdminFoodDatabaseProvider extends _$AdminFoodDatabaseProvider {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseConstants.foodDatabaseCollection)
        .orderBy('name')
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  Future<void> addFoodItem(Map<String, dynamic> item) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.foodDatabaseCollection)
        .add(item);
    ref.invalidateSelf();
  }

  Future<void> updateFoodItem(String id, Map<String, dynamic> item) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.foodDatabaseCollection)
        .doc(id)
        .update(item);
    ref.invalidateSelf();
  }

  Future<void> deleteFoodItem(String id) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.foodDatabaseCollection)
        .doc(id)
        .delete();
    ref.invalidateSelf();
  }
}

@riverpod
class AdminWorkoutProgramsProvider extends _$AdminWorkoutProgramsProvider {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(FirebaseConstants.workoutsCollection)
        .orderBy('name')
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  Future<void> addProgram(Map<String, dynamic> program) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.workoutsCollection)
        .add(program);
    ref.invalidateSelf();
  }

  Future<void> updateProgram(String id, Map<String, dynamic> program) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.workoutsCollection)
        .doc(id)
        .update(program);
    ref.invalidateSelf();
  }

  Future<void> deleteProgram(String id) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.workoutsCollection)
        .doc(id)
        .delete();
    ref.invalidateSelf();
  }
}

@riverpod
class AdminNotificationsProvider extends _$AdminNotificationsProvider {
  @override
  Future<bool> build() => Future.value(true);

  Future<void> sendNotification({
    required String title,
    required String message,
    required String target,
    DateTime? scheduledAt,
  }) async {
    final data = {
      'title': title,
      'message': message,
      'target': target,
      'scheduledAt': scheduledAt?.toIso8601String(),
      'createdAt': DateTime.now().toIso8601String(),
      'sent': false,
    };
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.notificationsCollection)
        .add(data);
  }
}

@riverpod
class IsAdminProvider extends _$IsAdminProvider {
  @override
  bool build() {
    return false;
  }
}
