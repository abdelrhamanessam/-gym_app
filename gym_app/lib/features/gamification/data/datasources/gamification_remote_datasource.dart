import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gym_app/core/constants/firebase_constants.dart';

part 'gamification_remote_datasource.g.dart';

@riverpod
GamificationRemoteDataSource gamificationRemoteDataSource(
  GamificationRemoteDataSourceRef ref,
) {
  return GamificationRemoteDataSource(FirebaseFirestore.instance);
}

class GamificationRemoteDataSource {
  final FirebaseFirestore _firestore;

  GamificationRemoteDataSource(this._firestore);

  CollectionReference get _userXp =>
      _firestore.collection('${FirebaseConstants.usersCollection}_xp');

  CollectionReference get _achievements =>
      _firestore.collection(FirebaseConstants.achievementsCollection);

  CollectionReference get _userAchievements =>
      _firestore.collection('${FirebaseConstants.usersCollection}_achievements');

  Future<DocumentSnapshot?> getUserXp(String userId) async {
    final query = await _userXp.where('userId', isEqualTo: userId).limit(1).get();
    if (query.docs.isEmpty) return null;
    return query.docs.first;
  }

  Future<void> setUserXp(String docId, Map<String, dynamic> data) async {
    await _userXp.doc(docId).set(data, SetOptions(merge: true));
  }

  Future<List<QueryDocumentSnapshot>> getAchievements() async {
    final query = await _achievements.get();
    return query.docs;
  }

  Future<List<QueryDocumentSnapshot>> getUserAchievements(String userId) async {
    final query = await _userAchievements
        .where('userId', isEqualTo: userId)
        .orderBy('unlockedAt', descending: true)
        .get();
    return query.docs;
  }

  Future<DocumentReference> addUserAchievement(
    Map<String, dynamic> data,
  ) async {
    return await _userAchievements.add(data);
  }

  Future<List<QueryDocumentSnapshot>> getLeaderboard() async {
    final query = await _userXp.orderBy('totalXp', descending: true).limit(100).get();
    return query.docs;
  }

  Future<DocumentSnapshot?> getAchievementById(String id) async {
    final doc = await _achievements.doc(id).get();
    if (!doc.exists) return null;
    return doc;
  }
}
