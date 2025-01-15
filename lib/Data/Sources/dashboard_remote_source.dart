import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Core/Config/Constants/app_urls.dart';
import '../Models/dashboard.dart';

abstract class DashboardRemoteSource {
  Future<DashboardModel> fetchDashboardData();
}

class DashboardRemoteSourceImpl implements DashboardRemoteSource {
  final http.Client client;

  DashboardRemoteSourceImpl({required this.client});

  @override
  Future<DashboardModel> fetchDashboardData() async {
    AppURLS appURLs = AppURLS();

    // Fetch the token using the AppURLS class
    String? authToken = await appURLs.getAuthToken();
    print('Token: $authToken');

    if (authToken == null) {
      // Handle missing token
      print('Authentication token not available.');
      throw Exception('Authentication token not available.');
    }

    print('Token: $authToken');

    final response = await client.get(
      Uri.parse('${AppURLS().Basepath}/api/dashboard'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken', // Include token in header
      },
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');


    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return DashboardModel.fromJson(data);
    } else {
      throw Exception('Failed to load dashboard data');
    }
  }
}
