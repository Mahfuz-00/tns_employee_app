import 'dart:convert';
import 'package:flutter/services.dart';
import '../../Core/Config/Constants/app_urls.dart';
import '../Models/activity.dart';
import 'package:http/http.dart' as http;

class ActivityRemoteDataSource {
  // Fetch tasks from local JSON file (mock data) or remote URL
  Future<List<ActivityModel>> getTasks() async {
    // Load the mock tasks from assets (local mock data)
   /* final jsonString = await rootBundle.loadString('Assets/Mock/task.json');
    final data = json.decode(jsonString) as List;

    // Convert the JSON data into TaskModel list using fromJson
    return data.map((e) => ActivityModel.fromJson(e)).toList();*/


     final response = await http.get(Uri.parse('${AppURLS().Basepath}/api/activity/list/'));
     print('response StatusCode: ${response.statusCode}');
     print('Error: ${response.body}');
     if (response.statusCode == 200) {
       final data = json.decode(response.body) as List;
       print('Fetched Activity Dashboard: $data');
       return data.map((e) => ActivityModel.fromJson(e)).toList();
     } else {
       throw Exception('Failed to load activities');
     }
  }
}
