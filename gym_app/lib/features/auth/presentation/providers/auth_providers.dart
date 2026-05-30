import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../providers/app_providers.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_providers.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSource(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
    googleSignIn: ref.watch(googleSignInProvider),
  );
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(ref.watch(authRemoteDataSourceProvider));
}

@riverpod
FirebaseFirestore firestore(FirestoreRef ref) => FirebaseFirestore.instance;

@riverpod
GoogleSignIn googleSignIn(GoogleSignInRef ref) => GoogleSignIn();

@riverpod
Stream<AuthUser?> authState(AuthStateRef ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges().map(
    (user) {
      if (user == null) return null;
      return AuthUser(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName,
        photoUrl: user.photoURL,
        isEmailVerified: user.emailVerified,
      );
    },
  );
}

@riverpod
Future<void> signIn(SignInRef ref,
    {required String email, required String password}) async {
  final repository = ref.watch(authRepositoryProvider);
  await repository.signInWithEmail(email, password);
}

@riverpod
Future<void> signUp(SignUpRef ref,
    {required String email,
    required String password,
    required String name}) async {
  final repository = ref.watch(authRepositoryProvider);
  await repository.signUpWithEmail(email, password, name);
}

@riverpod
Future<void> googleSignInAction(GoogleSignInActionRef ref) async {
  final repository = ref.watch(authRepositoryProvider);
  await repository.signInWithGoogle();
}

@riverpod
Future<void> appleSignInAction(AppleSignInActionRef ref) async {
  final repository = ref.watch(authRepositoryProvider);
  await repository.signInWithApple();
}

@riverpod
Future<void> sendPasswordReset(SendPasswordResetRef ref,
    {required String email}) async {
  final repository = ref.watch(authRepositoryProvider);
  await repository.sendPasswordReset(email);
}

@riverpod
Future<void> signOutAction(SignOutActionRef ref) async {
  final repository = ref.watch(authRepositoryProvider);
  await repository.signOut();
}

@riverpod
Future<UserProfile> userProfile(UserProfileRef ref,
    {required String uid}) async {
  final repository = ref.watch(authRepositoryProvider);
  return repository.getUserProfile(uid);
}

@riverpod
Future<void> updateUserProfile(UpdateUserProfileRef ref,
    {required String uid, required UserProfile profile}) async {
  final repository = ref.watch(authRepositoryProvider);
  await repository.updateUserProfile(uid, profile);
}
