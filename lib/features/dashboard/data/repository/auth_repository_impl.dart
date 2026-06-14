import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

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