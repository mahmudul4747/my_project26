import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/services/user_database_service.dart';
import '../../data/models/user_model.dart';

final userProfileProvider =
    FutureProvider<UserModel?>((ref) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) return null;

  final data =
      await UserDatabaseService().getUser(
    user.uid,
  );

  if (data == null) return null;

  return UserModel.fromMap(data);
});