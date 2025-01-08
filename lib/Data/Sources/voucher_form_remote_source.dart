import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Core/Config/Constants/app_urls.dart';

class VoucherFormRemoteDataSource {
  final http.Client client;

  VoucherFormRemoteDataSource(this.client);

  Future<void> submitVoucherForm(Map<String, dynamic> voucher) async {

    AppURLS appURLs = AppURLS();

    // Fetch the token using the AppURLS class
    String? authToken = await appURLs.getAuthToken();
    print('Token: $authToken');

    if (authToken == null) {
      // Handle the case when the token is not available
      print('Token is not available.');
    }

    print(voucher);

    final url = '${AppURLS().Basepath}/api/voucher/store';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };

    final response = await client.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(voucher),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      print('Response Body: ${response.body}');
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print('Voucher data sent successfully');
      print(jsonResponse);
      //return jsonResponse;
    } else {
      print('Response Body: ${response.body}');
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print('Missing Data :$jsonResponse');
      print(
          'Failed to send voucher data. Status code: ${response.statusCode}');
      throw Exception('Failed to create Voucher: ${response.body}');
    }
  }
}
