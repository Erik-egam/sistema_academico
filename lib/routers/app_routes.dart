import 'package:go_router/go_router.dart';
import 'package:sistema_academico/screens/admin/admin_screen.dart';
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
  ],
);