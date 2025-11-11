import 'package:flutter/material.dart';
import 'package:sistema_academico/services/api_service.dart';

class CrearProgramaScreen extends StatefulWidget {
  const CrearProgramaScreen({super.key});
  static String name = 'crear_programa_screen';

  @override
  State<CrearProgramaScreen> createState() => _CrearProgramaScreenState();
}

class _CrearProgramaScreenState extends State<CrearProgramaScreen> {
  final _formKey = GlobalKey<FormState>();
  String nombre = '';
  String descripcion = '';
  bool isLoading = false;

  Future<void> _crearPrograma() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() {
      isLoading = true;
    });

    try {
      await ApiService().crearPrograma(nombre, descripcion);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Programa creado exitosamente')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al crear programa: $e')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Crear Programa")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre del programa',
                ),
                onSaved: (value) => nombre = value ?? '',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obligatorio' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
                onSaved: (value) => descripcion = value ?? '',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obligatorio' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: isLoading ? null : _crearPrograma,
                icon: Icon(Icons.save, color: Colors.white),
                label: isLoading
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Text(
                        "Guardar",
                        style: TextStyle(
                          color: Colors.white,
                        ), // <-- visible en tema oscuro
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
