import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepositoryImpl>(
  (ref) => AuthRepositoryImpl(),
);

final authLoadingProvider = StateProvider<bool>((ref) => false);

final authProvider = Provider<AuthRepositoryImpl>(
  (ref) => ref.read(authRepositoryProvider),
);