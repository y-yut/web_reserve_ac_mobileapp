import '../models/user.dart';

class AuthRepository {
  Future<User?> login(String mail, String password) async {
    // 仮実装
    if (mail == 'user' && password == 'pass') {
      return User(user_id: mail, name: 'ユーザー');
    }
    return null;
  }
}