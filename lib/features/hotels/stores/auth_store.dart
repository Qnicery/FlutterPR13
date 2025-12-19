import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/api/auth_api.dart';
import '../models/user.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  static const keyUserId = 'current_user_id';
  static const keyJwtToken = 'jwt_token';

  final AuthApi _api = AuthApi();

  @observable
  User? currentUser;

  @computed
  bool get isLoggedIn => currentUser != null;

  _AuthStore() {
    _loadUser();
  }

  @action
  Future<String?> login(String email, String password) async {
    try {

      await _api.login(email, password);

      final id = await _fetchUserIdAfterLogin();

      final prefs = await SharedPreferences.getInstance();
      prefs.setInt(keyUserId, id);
      prefs.setString(keyJwtToken, _api.token ?? '');

      await _loadProfile(id);

      return null;
    } catch (e) {
      return 'Неверные данные или пользователь не существует';
    }
  }

  @action
  Future<String?> register(String email, String password, String name) async {
    try {

      final id = await _api.register(email, password, name);

      final prefs = await SharedPreferences.getInstance();
      prefs.setInt(keyUserId, id);
      prefs.setString(keyJwtToken, _api.token ?? '');

      await _loadProfile(id);

      return null;
    } catch (e) {
      return 'Ошибка регистрации: ${e.toString()}';
    }
  }

  @action
  Future<void> logout() async {
    currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(keyUserId);
    prefs.remove(keyJwtToken);
    _api.setToken('');
  }

  @action
  Future<void> deleteAccount() async {
    if (currentUser == null) return;

    await _api.deleteUser(currentUser!.id);

    await logout();
  }


  Future<void> _loadProfile(int id) async {
    final data = await _api.getUser(id);
    currentUser = User.fromReqRes(data);

    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyUserId, id);
  }


  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();


    final token = prefs.getString(keyJwtToken);
    if (token != null && token.isNotEmpty) {
      _api.setToken(token);

    final id = prefs.getInt(keyUserId);
    if (id != null) {
      try {
        await _loadProfile(id);
      } catch (_) {

        await logout();
      }
    }
  }
  }


  Future<int> _fetchUserIdAfterLogin() async {
    final data = await _api.getMe();
    return data['user']['id'];
  }
}
