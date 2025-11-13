import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sistema_academico/models/info_asignatura.dart';
import 'package:sistema_academico/models/info_nota.dart';
import 'package:sistema_academico/models/info_programa.dart';
import 'package:sistema_academico/models/info_semestre.dart';
import 'package:sistema_academico/models/info_usuario.dart';

class ApiService {
  final Dio dio;
  final _storage = FlutterSecureStorage();
  ApiService()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'http://192.168.40.11:8000/',
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
      for (Map<String, dynamic> programa in response.data) {
        programas.add(InfoPrograma.fromJson(programa));
      }

      return programas;
    } catch (e) {
      return [];
    }
  }

  Future<List<InfoUsuario>> getProfesoresPrograma(int idPrograma) async {
    try {
      final token = await _storage.read(key: 'token');
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get('/admin/programa/profesores/$idPrograma');

      List<InfoUsuario> profesores = [];
      for (Map<String, dynamic> profesor in response.data) {
        profesores.add(InfoUsuario.fromJson(profesor));
      }

      return profesores;
    } catch (e) {
      return [];
    }
  }

  Future<List<InfoUsuario>> getEstudiantesPrograma(int idPrograma) async {
    try {
      final token = await _storage.read(key: 'token');
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get('/admin/programa/estudiantes/$idPrograma');

      List<InfoUsuario> estudiantes = [];
      for (Map<String, dynamic> estudiante in response.data) {
        estudiantes.add(InfoUsuario.fromJson(estudiante));
      }

      return estudiantes;
    } catch (e) {
      return [];
    }
  }

  Future<bool> eliminarUsuario(int idUsuario) async {
    try {
      final token = await _storage.read(key: 'token');
      dio.options.headers['Authorization'] = 'Bearer $token';
      await dio.put('/admin/eliminar/usuario/$idUsuario');
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> activarUsuario(int idUsuario) async {
    try {
      final token = await _storage.read(key: 'token');
      dio.options.headers['Authorization'] = 'Bearer $token';
      await dio.put('/admin/activar/usuario/$idUsuario');
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> registrarUsuario(
    int id,
    String nombre,
    String apellido,
    String email,
    int idPrograma,
    String idRol,
  ) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.post(
        '/admin/registrar/usuario',
        data: {
          "id_usuario": id,
          "nombre": nombre,
          "apellido": apellido,
          "email": email,
          "id_programa": idPrograma,
          "id_rol": idRol,
        },
      );
      if (response.statusCode != 201) {
        return false;
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<List<InfoAsignatura>> getAsignaturas(int idPrograma) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    List<InfoAsignatura> asignaturas = [];
    try {
      final response = await dio.get('/admin/programa/asignaturas/$idPrograma');
      if (response.statusCode != 200) return [];
      for (Map<String, dynamic> json in response.data) {
        asignaturas.add(InfoAsignatura.fromJson(json));
      }
      return asignaturas;
    } catch (_) {
      return [];
    }
  }

  Future<List<InfoAsignatura>> getAsignaturasProfesor(int idProfesor) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    List<InfoAsignatura> asignaturas = [];
    try {
      final response = await dio.get('/admin/profesor/asignaturas/$idProfesor');
      if (response.statusCode != 200) return [];
      for (Map<String, dynamic> json in response.data) {
        asignaturas.add(InfoAsignatura.fromJson(json));
      }
      return asignaturas;
    } catch (_) {
      return [];
    }
  }

  Future<List<InfoAsignatura>> getAsignaturasDictandoProfesor() async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    List<InfoAsignatura> asignaturas = [];
    try {
      final response = await dio.get('/profesor/cursos/');
      if (response.statusCode != 200) return [];
      for (Map<String, dynamic> json in response.data) {
        asignaturas.add(InfoAsignatura.fromJson(json));
      }
      return asignaturas;
    } catch (_) {
      return [];
    }
  }

  Future<bool> asignarProfesorAsignatura(
    int idProfesor,
    int idAsignatura,
  ) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.put(
        '/admin/asignar/profesor/$idProfesor/asignatura/$idAsignatura',
      );
      if (response.statusCode != 202) return false;

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> registrarAsignatura(
    String codigo,
    String nombre,
    int creditos,
    int idPrograma,
  ) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await dio.post(
        '/admin/registrar/asignatura',
        data: {
          "codigo": codigo,
          "nombre": nombre,
          "creditos": creditos,
          "id_programa": idPrograma,
        },
      );
      if (response.statusCode != 201) {
        return false;
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> crearPrograma(String nombre, String descripcion) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await dio.post(
        '/admin/registrar/programa',
        data: {"nombre": nombre, "descripcion": descripcion},
      );
      if (response.statusCode != 201) {
        return false;
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> crearSemestre(
    String fechaInicio,
    String fechaFin,
    String nombre,
  ) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      final response = await dio.post(
        '/admin/registrar/semestre',
        data: {
          "nombre": nombre,
          "fecha_inicio": fechaFin,
          "fecha_fin": fechaFin,
        },
      );
      if (response.statusCode != 201) {
        return false;
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> habilitarAsignatura(int idAsignatura) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.put(
        '/admin/avilitar/asignatura/$idAsignatura',
      );
      if (response.statusCode != 200) return false;
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> matricularAsignatura(int idAsignatura) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      final response = await dio.put('/estudiante/matricular/$idAsignatura');
      if (response.statusCode != 200) return false;
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<List<InfoAsignatura>> getAsignaturasDisponibles(int idPrograma) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    List<InfoAsignatura> asignaturas = [];
    try {
      final response = await dio.get(
        '/admin/programa/asignaturas/$idPrograma/todas',
      );
      if (response.statusCode != 200) return [];
      for (Map<String, dynamic> json in response.data) {
        asignaturas.add(InfoAsignatura.fromJson(json));
      }
      return asignaturas;
    } catch (_) {
      return [];
    }
  }

  Future<List<InfoAsignatura>> getAsignaturasMatriculadas() async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    List<InfoAsignatura> asignaturas = [];
    try {
      final response = await dio.get('/estudiante/asignaturas/matriculadas');
      if (response.statusCode != 200) return [];
      for (Map<String, dynamic> json in response.data) {
        asignaturas.add(InfoAsignatura.fromJson(json));
      }
      return asignaturas;
    } catch (_) {
      return [];
    }
  }

  Future<List<InfoSemestre>> getSemestresEstudiante() async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    List<InfoSemestre> semestres = [];
    try {
      final response = await dio.get('/estudiante/semestres');
      if (response.statusCode != 200) return [];
      for (Map<String, dynamic> json in response.data) {
        semestres.add(InfoSemestre.fromJson(json));
      }
      return semestres;
    } catch (_) {
      return [];
    }
  }

  Future<List<InfoNota>> getNotasPorSemestre(int idSemestre) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    List<InfoNota> notas = [];
    try {
      final response = await dio.get('/estudiante/semestres/notas/$idSemestre');
      if (response.statusCode != 200) return [];
      for (Map<String, dynamic> json in response.data) {
        notas.add(InfoNota.fromJson(json));
      }
      return notas;
    } catch (_) {
      return [];
    }
  }

  Future<List<InfoAsignatura>> getAsignaturasDisponiblesEstudiante() async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    List<InfoAsignatura> asignaturas = [];
    try {
      final response = await dio.get('/estudiante/asignaturas/disponibles');
      if (response.statusCode != 200) return [];
      for (Map<String, dynamic> json in response.data) {
        asignaturas.add(InfoAsignatura.fromJson(json));
      }
      return asignaturas;
    } catch (_) {
      return [];
    }
  }

  Future<List<InfoUsuario>> getEstudiantesPorAsignatura(int idAsignatura) async {
    final token = await _storage.read(key: 'token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    List<InfoUsuario> estudiantes = [];
    try {
      final response = await dio.get('/profesor/estudiantes/asignatura/$idAsignatura');
      if (response.statusCode != 200) return [];
      for (Map<String, dynamic> json in response.data) {
        estudiantes.add(InfoUsuario.fromJson(json));
      }
      return estudiantes;
    } catch (_) {
      return [];
    }
  }
}
