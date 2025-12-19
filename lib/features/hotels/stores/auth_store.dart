import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  static const String keyUserId = "current_user_id";

  @observable
  ObservableList<User> users = ObservableList.of(
    [
      User(
        id: 1,
        name: "Admin",
        email: "test@mail.ru",
        password: "1",
      ),
    ],
  );

  @observable
  User? currentUser;

  _AuthStore() {
    _loadUserFromPrefs();
  }

  @computed
  bool get isLoggedIn => currentUser != null;



  Future<void> _saveCurrentUserId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(keyUserId, id);
  }

  Future<void> _removeSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyUserId);
  }

  Future<void> _loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final savedId = prefs.getInt(keyUserId);

    if (savedId != null) {
      try {
        currentUser = users.firstWhere((u) => u.id == savedId);
      } catch (_) {
        currentUser = null;
      }
    }
  }

  @action
  Future<String?> register(String name, String email, String password) async {
    if (users.any((u) => u.email == email)) {
      return 'Почта уже используется';
    }

    final user = User(
      id: users.length + 1,
      name: name,
      email: email,
      password: password,
    );

    users.add(user);
    currentUser = user;

    await _saveCurrentUserId(user.id);

    return null;
  }

  @action
  Future<String?> login(String login, String password) async {
    final user = users.firstWhere(
          (u) => (u.email == login || u.name == login) && u.password == password,
      orElse: () => User(id: -1, name: '', email: '', password: ''),
    );

    if (user.id == -1) {
      return 'Неверные данные';
    }

    currentUser = user;

    await _saveCurrentUserId(user.id);

    return null;
  }

  @action
  Future<void> logout() async {
    currentUser = null;
    await _removeSavedUser();
  }
}
