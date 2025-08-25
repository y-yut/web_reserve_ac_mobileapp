import '../models/user.dart';

class AuthRepository {
  Future<User?> login(String id, String password) async {
    // 仮実装
    if (id == 'user' && password == 'pass') {
      return User(id: id, name: 'ユーザー');
    }
    return null;
  }
}