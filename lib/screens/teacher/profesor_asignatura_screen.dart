import 'package:flutter/material.dart';
import 'package:sistema_academico/models/info_asignatura.dart';
import 'package:sistema_academico/models/info_usuario.dart';
import 'package:sistema_academico/services/api_service.dart';

class ProfesorDetalleAsignaturaScreen extends StatefulWidget {
  final InfoAsignatura infoAsignatura;
  static const String name = "profesor_detalle_asignatura_screen";

  const ProfesorDetalleAsignaturaScreen({
    super.key,
    required this.infoAsignatura,
  });

  @override
  State<ProfesorDetalleAsignaturaScreen> createState() =>
      _ProfesorDetalleAsignaturaScreenState();
}

class _ProfesorDetalleAsignaturaScreenState
    extends State<ProfesorDetalleAsignaturaScreen> {
  List<InfoUsuario> estudiantes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEstudiantes();
  }

  Future<void> _loadEstudiantes() async {
    try {
      final api = ApiService();
      final data =
          await api.getEstudiantesPorAsignatura(widget.infoAsignatura.id);
      setState(() {
        estudiantes = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final asignatura = widget.infoAsignatura;

    return Scaffold(
      appBar: AppBar(
        title: Text(asignatura.nombre),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadEstudiantes,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    'Estudiantes matriculados en "${asignatura.nombre}"',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  if (estudiantes.isEmpty)
                    const Center(
                      child: Text(
                        'No hay estudiantes matriculados en esta asignatura.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  else
                    ...estudiantes.map(
                      (e) => _EstudianteCard(estudiante: e),
                    ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
    );
  }
}

class _EstudianteCard extends StatelessWidget {
  final InfoUsuario estudiante;

  const _EstudianteCard({required this.estudiante});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(estudiante.name),
        subtitle: Text('Código: ${estudiante.id}'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
