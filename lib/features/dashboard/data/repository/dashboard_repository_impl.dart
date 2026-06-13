import '../dao/dashboard_dao.dart';

class DashboardRepositoryImpl {
  final DashboardDao dao;

  DashboardRepositoryImpl(this.dao);

  Future<String> getTitle() async {
    final data = await dao.fetchDashboard();
    return data["title"];
  }
}