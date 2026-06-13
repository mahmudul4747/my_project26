import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../models/dashboard_model.dart';

class DashboardDao {
  final Dio dio;

  DashboardDao(this.dio);

  Future<DashboardModel> fetchDashboard() async {
    final response = await dio.get(ApiEndpoints.dashboard);

    return DashboardModel.fromJson(response.data);
  }
}