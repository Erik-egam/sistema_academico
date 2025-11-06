import 'package:flutter/material.dart';
import 'package:sistema_academico/routers/app_routes.dart';
import 'package:sistema_academico/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Sistema academico',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}