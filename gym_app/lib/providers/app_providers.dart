import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'app_providers.g.dart';

@riverpod
auth.FirebaseAuth firebaseAuth(FirebaseAuthRef ref) => auth.FirebaseAuth.instance;

@riverpod
Stream<auth.User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
}

@riverpod
Stream<auth.User?> userChanges(UserChangesRef ref) {
  return ref.watch(firebaseAuthProvider).userChanges();
}
