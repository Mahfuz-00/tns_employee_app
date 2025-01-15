import '../../Domain/Entities/dashboard_entities.dart';

class DashboardModel extends DashboardEntity {
  DashboardModel({
    required String title,
    required String description,
    required int totalItems,
  }) : super(
    title: title,
    description: description,
    totalItems: totalItems,
  );

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      totalItems: json['total_items'] ?? 0,
    );
  }
}
