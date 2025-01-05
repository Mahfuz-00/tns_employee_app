import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Core/Config/Constants/app_urls.dart';
import '../Models/activity_form.dart';

class ActivityFormRemoteDataSource {
  final http.Client client;

  ActivityFormRemoteDataSource(this.client);

  Future<void> createActivity(ActivityFormModel activity) async {
    final url = Uri.parse('${AppURLS().Basepath}/api/activity/task/store');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'actvTitle': activity.title,
        'actvProject': activity.project,
        'actvStartDate': activity.startDate,
        'actvEndDate': activity.endDate,
        'actvEstimatedHour': activity.estimatedHour,
        'actvProjectUser': activity.projectUser,
        'actvDescription': activity.description,
        'priority': activity.priority,
        'status': activity.status,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create activity: ${response.body}');
    }
  }
}
