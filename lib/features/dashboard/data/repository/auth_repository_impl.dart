import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repository/auth_repository.dart';
// Removed firebase_database import to avoid missing package error.

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 // Realtime database removed from this implementation to avoid missing package dependency.
  @override
  Future<bool> login(String email, String password) async {
  try {   
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    print("LOGIN SUCCESS");
    return true;
  } on FirebaseAuthException catch (e) {
    print("LOGIN ERROR: ${e.code}");
    print("MESSAGE: ${e.message}");
    return false;
  } catch (e) {
    print("OTHER ERROR: $e");
    return false;
  }
}

  Future<bool> register(String email, String password) async {
  try {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user!.uid;
    // Database write removed. If you need to store additional user data,
    // add firebase_database dependency and restore the database code.

    print("REGISTER SUCCESS");
    return true;
  } on FirebaseAuthException catch (e) {
    print("REGISTER ERROR: ${e.code}");
    print("MESSAGE: ${e.message}");
    return false;
  } catch (e) {
    print("OTHER ERROR: $e");
    return false;
  }
}
  Future<void> logout() async {
    await _auth.signOut();
  }
}