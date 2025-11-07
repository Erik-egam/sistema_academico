import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_academico/screens/admin/admin_screen.dart';
import 'package:sistema_academico/services/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String name = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ApiService apiService = ApiService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Sistema Académico',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Inicio de Sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Campo de correo
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E2B23),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                        border: InputBorder.none,
                        hintText: 'Correo electrónico',
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Campo de contraseña
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E2B23),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                        border: InputBorder.none,
                        hintText: 'Contraseña',
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Botón de iniciar sesión
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() => _isLoading = true);
                        await apiService
                            .login(
                              emailController.text,
                              passwordController.text,
                            )
                            .then((exito) async {
                              if (exito) {
                                final rol = await apiService.getRol();
                                if (rol == 'ADMIN') {
                                  // ignore: use_build_context_synchronously
                                  context.goNamed(AdminScreen.name);
                                }
                              }
                            });
                        setState(() => _isLoading = false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1AF971),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: _isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.black,
                              ),
                            )
                          : const Text(
                              'Iniciar Sesión',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
