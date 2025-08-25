import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/auth_repository.dart';
import '../models/user.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  User? build() => null;

  Future<void> login(String id, String password) async {
    final repo = AuthRepository();
    final user = await repo.login(id, password);
    if (user != null) {
      state = user;
    }
  }

  void logout() {
    state = null;
  }
}