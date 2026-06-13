import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/dao/dashboard_dao.dart';
import '../../data/models/dashboard_model.dart';
import '../../data/repository/dashboard_repository_impl.dart';

final dioProvider = Provider<Dio>(
  (ref) => DioClient.instance.dio,
);

final dashboardDaoProvider = Provider<DashboardDao>(
  (ref) => DashboardDao(ref.read(dioProvider)),
);

final dashboardRepositoryProvider = Provider<DashboardRepositoryImpl>(
  (ref) => DashboardRepositoryImpl(ref.read(dashboardDaoProvider)),
);

final dashboardProvider = FutureProvider<DashboardModel>((ref) async {
  final repo = ref.read(dashboardRepositoryProvider);
  return repo.getDashboard();
});