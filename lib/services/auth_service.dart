import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '192.168.0.11:8000', // Cambia por tu backend
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    ),
  );

  final _storage = const FlutterSecureStorage();

  /// 🔐 Iniciar sesión
  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '/token', // endpoint para obtener token
        data: {
          'username': username,
          'password': password,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      final token = response.data['access_token'];
      final role = response.data['role']; // opcional si tu API lo devuelve

      if (token != null) {
        await _storage.write(key: 'token', value: token);
        if (role != null) await _storage.write(key: 'role', value: role);
        return true;
      }
      return false;
    } on DioException catch (e) {
      print('Error al iniciar sesión: ${e.response?.data ?? e.message}');
      return false;
    }
  }

  /// 📦 Obtener token guardado
  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  /// 🧭 Obtener rol guardado
  Future<String?> getRole() async {
    return await _storage.read(key: 'role');
  }

  /// 🚪 Cerrar sesión
  Future<void> logout() async {
    await _storage.deleteAll();
  }

  /// 🔁 Crear cliente Dio autenticado
  Future<Dio> getAuthorizedDio() async {
    final token = await getToken();
    final dio = Dio(BaseOptions(baseUrl: 'https://tu-api.com'));
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    return dio;
  }
}
