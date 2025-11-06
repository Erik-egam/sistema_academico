import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final Dio dio;
  final _storage = FlutterSecureStorage();
  ApiService()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'http://192.168.0.11:8000/',
          headers: {'Content-Type': 'application/json'},
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  Future<bool> login(String username, String password) async {
    try {
      final response = await dio.post(
        'users/login',
        data: {'username': username, 'password': password},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      final token = response.data['access_token'];
      final rol = response.data['rol'];

      if (token != null) {
        await _storage.write(key: 'token', value: token);
        if (rol != null) await _storage.write(key: 'rol', value: rol);
        return true;
      }
      return false;
    } on DioException catch (_) {
      return false;
    }
  }

  Future<String?> getRol() async {
    return _storage.read(key: 'rol');
  }
}
