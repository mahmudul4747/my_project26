import 'package:firebase_database/firebase_database.dart';

class UserDatabaseService {
  final FirebaseDatabase _database =
      FirebaseDatabase.instance;

  Future<void> saveUser({
    required String uid,
    required String email,
  }) async {
    await _database.ref('users/$uid').set({
      'uid': uid,
      'email': email,
      'role': 'user',
    });
  }

  Future<Map<String, dynamic>?> getUser(
    String uid,
  ) async {
    final snapshot =
        await _database.ref('users/$uid').get();

    if (snapshot.exists) {
      return Map<String, dynamic>.from(
        snapshot.value as Map,
      );
    }

    return null;
  }
}