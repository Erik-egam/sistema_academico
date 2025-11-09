import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sistema_academico/models/info_programa.dart';
import 'package:sistema_academico/models/info_usuario.dart';

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
  
  Future<List<InfoPrograma>> getProgramas() async {
    try {
      final token = await _storage.read(key: 'token');
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get('/admin/programas');

      List<InfoPrograma> programas = [];
      for (Map<String, dynamic> programa in response.data){
        programas.add(
          InfoPrograma.fromJson(programa)
        );
      }


      return programas;
    } catch (e){
      return [];
    }
  }
  Future<List<InfoUsuario>> getProfesoresPrograma(int idPrograma) async {
    try {
      final token = await _storage.read(key: 'token');
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get('/admin/programa/profesores/$idPrograma');

      List<InfoUsuario> profesores = [];
      for (Map<String, dynamic> profesor in response.data){
        profesores.add(
          InfoUsuario.fromJson(profesor)
        );
      }


      return profesores;
    } catch (e){
      return [];
    }
  }
  Future<bool> eliminarUsuario(int idUsuario) async {
    try {
      final token = await _storage.read(key: 'token');
      dio.options.headers['Authorization'] = 'Bearer $token';
      await dio.put('/admin/eliminar/usuario/$idUsuario');
      return true;
    } catch (_){
      return false;
    }
  }
  Future<bool> activarUsuario(int idUsuario) async {
    try {
      final token = await _storage.read(key: 'token');
      dio.options.headers['Authorization'] = 'Bearer $token';
      await dio.put('/admin/activar/usuario/$idUsuario');
      return true;
    } catch (_){
      return false;
    }
  }
  Future<bool> registrarUsuario(int id, String nombre, String apellido, String email, int idPrograma) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post('/admin/registrar/usuario',
      data: {
        "id_usuario":id,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "id_programa": idPrograma,
        "id_rol": "PROF"
      }
      );
      if (response.statusCode != 201){
        return false;
      }

      return true;
    } catch (_){
      return false;
    }
  }
}
