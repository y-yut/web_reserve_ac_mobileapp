import 'package:http/http.dart' as http;
import 'package:web_reserve_ac_mobileapp/core/utils/make_signature.dart';
import 'dart:convert';

class ApiClient {
  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future<http.Response> post(String endpoint, {Map<String, dynamic>? params}) async {
    final signature = MakeSignature.generate(params ?? {});
    final Map<String, dynamic> requestBody = {...?params};
    requestBody['signature'] = signature;

    try {
      return await httpClient.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
    } catch (e) {
      print('Error occurred while making POST request: $e');
      rethrow;
    }
  }

}