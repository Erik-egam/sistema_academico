// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sistema_academico/models/info_asignatura.dart';
import 'package:sistema_academico/models/info_nota.dart';
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
      final data = await api.getEstudiantesPorAsignatura(
        widget.infoAsignatura.id,
      );
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
      appBar: AppBar(title: Text(asignatura.nombre)),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadEstudiantes,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text(
                    'Estudiantes matriculados',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      (e) => _EstudianteCard(
                        estudiante: e,
                        asignatura: asignatura,
                      ),
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
  final InfoAsignatura asignatura;

  const _EstudianteCard({required this.estudiante, required this.asignatura});

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
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => _DialogPerfilEstudiante(
              estudiante: estudiante,
              asignatura: asignatura,
            ),
          );
        },
      ),
    );
  }
}

class _DialogPerfilEstudiante extends StatefulWidget {
  final InfoUsuario estudiante;
  final InfoAsignatura asignatura;

  const _DialogPerfilEstudiante({
    required this.estudiante,
    required this.asignatura,
  });

  @override
  State<_DialogPerfilEstudiante> createState() =>
      _DialogPerfilEstudianteState();
}

class _DialogPerfilEstudianteState extends State<_DialogPerfilEstudiante> {
  final _nota1Controller = TextEditingController();
  final _nota2Controller = TextEditingController();
  final _nota3Controller = TextEditingController();
  final _asistencia1Controller = TextEditingController();
  final _asistencia2Controller = TextEditingController();
  final _asistencia3Controller = TextEditingController();

  bool isSaving = false;
  bool isLoading = true;

  List<bool> editableNotas = [false, false, false];
  List<bool> editableAsistencias = [false, false, false];

  @override
  void initState() {
    super.initState();
    _cargarNotas();
  }

  Future<void> _cargarNotas() async {
    try {
      final api = ApiService();
      final InfoNota data = await api.obtenerNotasEstudiante(
        widget.estudiante.id,
        widget.asignatura.id,
      );

      setState(() {
        _nota1Controller.text = data.nota1 != 0 ? data.nota1.toString() : '';
        _nota2Controller.text = data.nota2 != 0 ? data.nota2.toString() : '';
        _nota3Controller.text = data.nota3 != 0 ? data.nota3.toString() : '';

        _asistencia1Controller.text = data.asistencia1 != null && data.asistencia1 != 0 
            ? data.asistencia1.toString()
            : '';
        _asistencia2Controller.text = data.asistencia2 != null && data.asistencia1 != 0
            ? data.asistencia2.toString()
            : '';
        _asistencia3Controller.text = data.asistencia3 != null && data.asistencia1 != 0
            ? data.asistencia3.toString()
            : '';

        // editable: nota si ≠ 0, asistencia si ≠ null
        editableNotas = [data.nota1 == 0.0, data.nota2 == 0.0, data.nota3 == 0.0];
        editableAsistencias = [
          data.asistencia1 == null || data.asistencia1 == 0,
          data.asistencia2 == null || data.asistencia2 == 0,
          data.asistencia3 == null || data.asistencia3 == 0,
        ];

        isLoading = false;
      });
    } catch (e) {
      // Si no hay registro previo, deja todo editable
      setState(() {
        editableNotas = [true, true, true];
        editableAsistencias = [true, true, true];
        isLoading = false;
      });
    }
  }

  Future<void> _guardarDatos() async {
    setState(() => isSaving = true);
    try {
      final api = ApiService();
      await api
          .asignarNotaYAsistencia(widget.estudiante.id, widget.asignatura.id, {
            "nota1": double.tryParse(_nota1Controller.text) ?? 0,
            "nota2": double.tryParse(_nota2Controller.text) ?? 0,
            "nota3": double.tryParse(_nota3Controller.text) ?? 0,
            "asistencia1": int.tryParse(_asistencia1Controller.text),
            "asistencia2": int.tryParse(_asistencia2Controller.text),
            "asistencia3": int.tryParse(_asistencia3Controller.text),
          });
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos guardados correctamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al guardar los datos')),
      );
    } finally {
      setState(() => isSaving = false);
    }
  }

  TableRow _filaNotaAsistencia(
    TextEditingController notaCtrl,
    TextEditingController asistenciaCtrl,
    bool editableNota,
    bool editableAsistencia,
  ) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: notaCtrl,
            enabled: editableNota,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              hintText: 'Ej: 4.0',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: asistenciaCtrl,
            enabled: editableAsistencia,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '% o valor entero',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final e = widget.estudiante;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text('Perfil de ${e.name} ${e.lastName}'),
      content: isLoading
          ? const SizedBox(
              height: 120,
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow('ID', e.id.toString()),
                  if (e.name.isNotEmpty) _infoRow('Nombre', e.name),
                  if (e.lastName.isNotEmpty) _infoRow('Apellido', e.lastName),
                  if (e.email.isNotEmpty) _infoRow('Email', e.email),
                  const SizedBox(height: 16),
                  const Divider(),
                  const Text(
                    'Registro académico',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                    },
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      const TableRow(
                        decoration: BoxDecoration(color: Colors.black38),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                'Nota',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                'Asistencia',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _filaNotaAsistencia(
                        _nota1Controller,
                        _asistencia1Controller,
                        editableNotas[0],
                        editableAsistencias[0],
                      ),
                      _filaNotaAsistencia(
                        _nota2Controller,
                        _asistencia2Controller,
                        editableNotas[1],
                        editableAsistencias[1],
                      ),
                      _filaNotaAsistencia(
                        _nota3Controller,
                        _asistencia3Controller,
                        editableNotas[2],
                        editableAsistencias[2],
                      ),
                    ],
                  ),
                ],
              ),
            ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cerrar'),
        ),
        ElevatedButton.icon(
          onPressed: isSaving ? null : _guardarDatos,
          icon: const Icon(Icons.save),
          label: Text(isSaving ? 'Guardando...' : 'Guardar cambios'),
        ),
      ],
    );
  }

  Widget _infoRow(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
