// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sistema_academico/models/info_nota.dart';
import 'package:sistema_academico/models/info_semestre.dart';
import 'package:sistema_academico/services/api_service.dart';

class EstudianteSemestresScreen extends StatelessWidget {
  const EstudianteSemestresScreen({super.key});
  static String name = 'estudiante_semestres_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mis Semestres")),
      body: const EstudianteSemestresView(),
    );
  }
}

class EstudianteSemestresView extends StatefulWidget {
  const EstudianteSemestresView({super.key});

  @override
  State<EstudianteSemestresView> createState() =>
      _EstudianteSemestresViewState();
}

class _EstudianteSemestresViewState extends State<EstudianteSemestresView> {
  List<InfoSemestre> semestres = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSemestres();
  }

  Future<void> _loadSemestres() async {
    try {
      final List<InfoSemestre> data = await ApiService()
          .getSemestresEstudiante();
      setState(() {
        semestres = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  Future<void> _mostrarNotasSemestre(
    BuildContext context,
    int idSemestre,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final List<InfoNota> notas = await ApiService().getNotasPorSemestre(idSemestre);
      // ignore: duplicate_ignore
      // ignore: use_build_context_synchronously
      Navigator.pop(context); // Cierra el loader

      // ignore: duplicate_ignore
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Notas del semestre"),
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Nombre")),
                DataColumn(label: Text("Nota 1")),
                DataColumn(label: Text("Asis 1")),
                DataColumn(label: Text("Nota 2")),
                DataColumn(label: Text("Asis 2")),
                DataColumn(label: Text("Nota 3")),
                DataColumn(label: Text("Asis 3")),
                DataColumn(label: Text("Nota Final")),
              ],
              rows: notas.map<DataRow>((n) {
                return DataRow(
                  cells: [
                    DataCell(Text(n.nombre)),
                    DataCell(Text(n.nota1.toString())),
                    DataCell(Text(n.asistencia1.toString())),
                    DataCell(Text(n.nota2.toString())),
                    DataCell(Text(n.asistencia2.toString())),
                    DataCell(Text(n.nota3.toString())),
                    DataCell(Text(n.asistencia3.toString())),
                    DataCell(Text(n.asistencia3.toString())),
                  ],
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cerrar"),
            ),
          ],
        ),
      );
    } catch (e) {
      Navigator.pop(context); // Cierra el loader si hay error
      // ignore: duplicate_ignore
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Error"),
          content: Text("No se pudieron cargar las notas: $e"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cerrar"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (semestres.isEmpty) {
      return const Center(child: Text("No tienes semestres registrados"));
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100),
      itemCount: semestres.length,
      itemBuilder: (context, index) {
        final semestre = semestres[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(
              semestre.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Inicio: ${semestre.fechaInicio}  |  Fin: ${semestre.fechaFin}",
            ),
            trailing: const Icon(Icons.calculate_outlined),
            onTap: () => _mostrarNotasSemestre(context, semestre.id),
          ),
        );
      },
    );
  }
}
