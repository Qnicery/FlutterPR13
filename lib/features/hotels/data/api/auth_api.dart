import 'package:dio/dio.dart';


class AuthApi {
  final Dio dio;
  String? _token;

  AuthApi()
      : dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8080', // Android эмулятор
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  void setToken(String token) {
    _token = token;
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  String? get token => _token;

  Future<void> login(String email, String password) async {
    final response = await dio.post('/login', data: {
      "email": email,
      "password": password,
    });

    final token = response.data['token'];
    if (token != null) setToken(token);
  }

  Future<int> register(String email, String password, String name) async {
    final response = await dio.post('/register', data: {
      "email": email,
      "password": password,
      "name": name,
    });

    final token = response.data['token'];
    if (token != null) setToken(token);

    if (response.data == null || response.data['user'] == null) {
      throw Exception('Пустой ответ от сервера');
    }

    return response.data['user']['id'];
  }

  Future<Map<String, dynamic>> getUser(int id) async {
    final response = await dio.get('/users/$id');
    return response.data;
  }

  Future<void> getUsers() async {
    await dio.get('/users');
  }

  Future<void> deleteUser(int id) async {
    await dio.delete('/users/$id');
  }

  Future<Map<String, dynamic>> getMe() async {
    final response = await dio.get('/me');
    return response.data;
  }

}
