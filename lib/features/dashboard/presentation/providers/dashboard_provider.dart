import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import 'package:my_project26/core/network/dio_client.dart';
import 'package:my_project26/features/dashboard/data/dao/dashboard_dao.dart';
import 'package:my_project26/features/dashboard/data/repository/dashboard_repository_impl.dart';

final dioProvider = Provider<Dio>(
  (ref) => DioClient.instance.dio,
);

final dashboardDaoProvider = Provider<DashboardDao>(
  (ref) => DashboardDao(ref.read(dioProvider)),
);

final dashboardRepositoryProvider = Provider<DashboardRepositoryImpl>(
  (ref) => DashboardRepositoryImpl(ref.read(dashboardDaoProvider)),
);

final dashboardTitleProvider = FutureProvider<String>((ref) async {
  final repo = ref.read(dashboardRepositoryProvider);
  return repo.getTitle();
});