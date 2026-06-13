import '../dao/dashboard_dao.dart';
import '../models/dashboard_model.dart';

class DashboardRepositoryImpl {
  final DashboardDao dao;

  DashboardRepositoryImpl(this.dao);

  Future<DashboardModel> getDashboard() async {
    return await dao.fetchDashboard();
  }
}