import 'package:go_router/go_router.dart';
import 'package:sistema_academico/models/info_programa.dart';
import 'package:sistema_academico/screens/admin/admin_programa_screen.dart';
import 'package:sistema_academico/screens/admin/admin_programas_screen.dart';
import 'package:sistema_academico/screens/admin/admin_screen.dart';
import 'package:sistema_academico/screens/admin/programa/admin_asignaturas_screen.dart';
import 'package:sistema_academico/screens/admin/programa/admin_crear_programa.dart';
import 'package:sistema_academico/screens/admin/programa/admin_estudiantes_screen.dart';
import 'package:sistema_academico/screens/admin/programa/admin_profesores_screen.dart';
import 'package:sistema_academico/screens/admin/semestre/admin_semestres.dart';
import 'package:sistema_academico/screens/student/student_matricula_screen.dart';
import 'package:sistema_academico/screens/student/student_screen.dart';
import 'package:sistema_academico/screens/student/student_semestres_screen.dart';
import '../screens/login_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/admin',
      name: AdminScreen.name,
      builder: (context, state) => AdminScreen(),
    ),
    GoRoute(
      path: '/admin/programas',
      name: AdminProgramasScreen.name,
      builder: (context, state) => AdminProgramasScreen(),
    ),
    GoRoute(
      path: '/admin/programa',
      name: AdminProgramaScreen.name,
      builder: (context, state) {
        final infoPrograma = state.extra as InfoPrograma;
        return AdminProgramaScreen(programa: infoPrograma,);
      },
    ),
    GoRoute(
      path: '/admin/profesores/:id',
      name: AdminProfesoresScreen.name,
      builder: (context, state) {
        final infoPrograma = state.pathParameters['id'];
        return AdminProfesoresScreen(idPrograma: int.parse(infoPrograma ?? '1'));
      },
    ),
    GoRoute(
      path: '/admin/estudiantes/:id',
      name: AdminEstudiantesScreen.name,
      builder: (context, state) {
        final infoPrograma = state.pathParameters['id'];
        return AdminEstudiantesScreen(idPrograma: int.parse(infoPrograma ?? '1'));
      },
    ),
    GoRoute(
      path: '/admin/asignaturas/:id',
      name: AdminAsignaturasScreen.name,
      builder: (context, state) {
        final infoPrograma = state.pathParameters['id'];
        return AdminAsignaturasScreen(idPrograma: int.parse(infoPrograma ?? '1'));
      },
    ),
    GoRoute(
      path: '/admin/crear_programa',
      name: CrearProgramaScreen.name,
      builder: (context, state) {
        return CrearProgramaScreen();
      },
    ),
    GoRoute(
      path: '/admin/crear_semestre',
      name: CrearSemestreScreen.name,
      builder: (context, state) {
        return CrearSemestreScreen();
      },
    ),
    GoRoute(
      path: '/estudiante',
      name: EstudianteScreen.name,
      builder: (context, state) {
        return EstudianteScreen();
      },
    ),
    GoRoute(
      path: '/estudiante/historico',
      name: EstudianteSemestresScreen.name,
      builder: (context, state) {
        return EstudianteSemestresScreen();
      },
    ),
    GoRoute(
      path: '/estudiante/matricular',
      name: EstudianteMatriculaScreen.name,
      builder: (context, state) {
        return EstudianteMatriculaScreen();
      },
    ),
  ],
);