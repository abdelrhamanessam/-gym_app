import '../entities/auth_user.dart';
import '../entities/user_profile.dart';

abstract class AuthRepository {
  Future<AuthUser> signInWithEmail(String email, String password);
  Future<AuthUser> signUpWithEmail(String email, String password, String name);
  Future<AuthUser> signInWithGoogle();
  Future<AuthUser> signInWithApple();
  Future<void> sendPasswordReset(String email);
  Future<void> signOut();
  AuthUser? getCurrentUser();
  Future<UserProfile> getUserProfile(String uid);
  Future<void> updateUserProfile(String uid, UserProfile profile);
}
