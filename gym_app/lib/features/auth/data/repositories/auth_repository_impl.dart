import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../../domain/entities/auth_user.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<AuthUser> signInWithEmail(String email, String password) async {
    final credential = await _remoteDataSource.signInWithEmail(email, password);
    return _mapFirebaseUser(credential.user);
  }

  @override
  Future<AuthUser> signUpWithEmail(
      String email, String password, String name) async {
    final credential =
        await _remoteDataSource.signUpWithEmail(email, password, name);
    await _remoteDataSource.updateDisplayName(name);
    final user = credential.user!;
    await _remoteDataSource.createUserProfile({
      'id': user.uid,
      'email': email,
      'name': name,
      'age': 25,
      'gender': 'male',
      'heightCm': 175.0,
      'weightKg': 70.0,
      'bodyFatPercent': 15.0,
      'activityLevel': 'moderate',
      'fitnessGoal': 'maintain',
      'photoUrl': user.photoURL,
      'createdAt': Timestamp.fromDate(DateTime.now()),
      'updatedAt': Timestamp.fromDate(DateTime.now()),
    });
    return _mapFirebaseUser(user);
  }

  @override
  Future<AuthUser> signInWithGoogle() async {
    final credential = await _remoteDataSource.signInWithGoogle();
    final user = credential.user!;
    final profileData = await _remoteDataSource.getUserProfile(user.uid);
    if (profileData == null) {
      await _remoteDataSource.createUserProfile({
        'id': user.uid,
        'email': user.email ?? '',
        'name': user.displayName ?? 'User',
        'age': 25,
        'gender': 'male',
        'heightCm': 175.0,
        'weightKg': 70.0,
        'bodyFatPercent': 15.0,
        'activityLevel': 'moderate',
        'fitnessGoal': 'maintain',
        'photoUrl': user.photoURL,
        'createdAt': Timestamp.fromDate(DateTime.now()),
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
    }
    return _mapFirebaseUser(user);
  }

  @override
  Future<AuthUser> signInWithApple() async {
    final credential = await _remoteDataSource.signInWithApple();
    final user = credential.user!;
    final profileData = await _remoteDataSource.getUserProfile(user.uid);
    if (profileData == null) {
      await _remoteDataSource.createUserProfile({
        'id': user.uid,
        'email': user.email ?? '',
        'name': user.displayName ?? 'User',
        'age': 25,
        'gender': 'male',
        'heightCm': 175.0,
        'weightKg': 70.0,
        'bodyFatPercent': 15.0,
        'activityLevel': 'moderate',
        'fitnessGoal': 'maintain',
        'photoUrl': user.photoURL,
        'createdAt': Timestamp.fromDate(DateTime.now()),
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });
    }
    return _mapFirebaseUser(user);
  }

  @override
  Future<void> sendPasswordReset(String email) {
    return _remoteDataSource.sendPasswordReset(email);
  }

  @override
  Future<void> signOut() => _remoteDataSource.signOut();

  @override
  AuthUser? getCurrentUser() {
    final user = _remoteDataSource.getCurrentUser();
    if (user == null) return null;
    return _mapFirebaseUser(user);
  }

  @override
  Future<UserProfile> getUserProfile(String uid) async {
    final data = await _remoteDataSource.getUserProfile(uid);
    if (data == null) {
      throw Exception('User profile not found');
    }
    return UserProfile(
      id: data['id'] as String,
      email: data['email'] as String,
      name: data['name'] as String,
      age: (data['age'] as num?)?.toInt() ?? 25,
      gender: (data['gender'] as String?) ?? 'male',
      heightCm: (data['heightCm'] as num?)?.toDouble() ?? 175.0,
      weightKg: (data['weightKg'] as num?)?.toDouble() ?? 70.0,
      bodyFatPercent: (data['bodyFatPercent'] as num?)?.toDouble() ?? 15.0,
      activityLevel: _parseActivityLevel(
          (data['activityLevel'] as String?) ?? 'moderate'),
      fitnessGoal:
          _parseFitnessGoal((data['fitnessGoal'] as String?) ?? 'maintain'),
      photoUrl: data['photoUrl'] as String?,
      createdAt: _parseTimestamp(data['createdAt']),
      updatedAt: _parseTimestamp(data['updatedAt']),
    );
  }

  @override
  Future<void> updateUserProfile(String uid, UserProfile profile) async {
    await _remoteDataSource.updateUserProfile(uid, {
      'name': profile.name,
      'age': profile.age,
      'gender': profile.gender,
      'heightCm': profile.heightCm,
      'weightKg': profile.weightKg,
      'bodyFatPercent': profile.bodyFatPercent,
      'activityLevel': profile.activityLevel.name,
      'fitnessGoal': profile.fitnessGoal.name,
      'photoUrl': profile.photoUrl,
      'updatedAt': Timestamp.fromDate(DateTime.now()),
    });
  }

  AuthUser _mapFirebaseUser(auth.User? user) {
    if (user == null) throw Exception('User not authenticated');
    return AuthUser(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL,
      isEmailVerified: user.emailVerified,
    );
  }

  ActivityLevel _parseActivityLevel(String value) {
    return ActivityLevel.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ActivityLevel.moderate,
    );
  }

  FitnessGoal _parseFitnessGoal(String value) {
    return FitnessGoal.values.firstWhere(
      (e) => e.name == value,
      orElse: () => FitnessGoal.maintain,
    );
  }

  DateTime _parseTimestamp(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.parse(value);
    return DateTime.fromMillisecondsSinceEpoch(
        (value as int?) ?? DateTime.now().millisecondsSinceEpoch);
  }
}
