import 'dart:convert';
import 'package:flutter/services.dart';
import '../Models/tasks.dart';

class TaskRemoteDataSource {
  // Fetch tasks from local JSON file (mock data) or remote URL
  Future<List<TaskModel>> getTasks() async {
    // Load the mock tasks from assets (local mock data)
    final jsonString = await rootBundle.loadString('Assets/Mock/task.json');
    final data = json.decode(jsonString) as List;

    // Convert the JSON data into TaskModel list using fromJson
    return data.map((e) => TaskModel.fromJson(e)).toList();

    // Uncomment this section for future remote fetching (API call)
    // final response = await http.get(Uri.parse('https://your-api-url.com/tasks'));
    // if (response.statusCode == 200) {
    //   final data = json.decode(response.body) as List;
    //   return data.map((e) => TaskModel.fromJson(e)).toList();
    // } else {
    //   throw Exception('Failed to load tasks');
    // }
  }
}
