import 'dart:convert';
import 'dart:io';
import 'package:web_reserve_ac_mobileapp/core/services/api_client.dart';
import 'package:web_reserve_ac_mobileapp/core/constants/api_endpoints.dart';

/// APIリポジトリ
class ApiRepository {
  final ApiClient apiClient;

  ApiRepository({required this.apiClient});

  /// ログイン
  /// [clinicId] クリニックID
  /// [mail] メールアドレス
  /// [password] パスワード
  /// [token] トークン
  /// 取得したデータのmap|例外
  Future<Map<String, dynamic>> login(int clinicId, String mail, String password, String token) async {
    Map<String, dynamic> result = {};

    String tokenKey = Platform.isAndroid ? 'token_and' : Platform.isIOS ? 'token_ios' : 'token';

    final response = await apiClient.post(
      ApiEndpoints.login,
      params: {
        'clinic_id': clinicId,
        'mail': mail,
        'pass': password,
        tokenKey: token,
      },
    );

    if (response.statusCode == 200) {
      result = jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }

    return result;
  }

  // Future<Map<String, dynamic>> signupAccount(int c) async {
  //   Map<String, dynamic> result = {};

  //   final response = await apiClient.post(
  //     ApiEndpoints.userData,
  //     params: {
  //       'user_id': userId,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     result = jsonDecode(response.body);
  //   } else {
  //     throw Exception('Failed to fetch user data');
  //   }

  //   return result;
  // }
}
