import 'package:flutter/material.dart';
import 'package:sistema_academico/models/info_asignatura.dart';
import 'package:sistema_academico/services/api_service.dart';

class EstudianteMatriculaScreen extends StatelessWidget {
  const EstudianteMatriculaScreen({super.key});

  static String name = 'estudiante_matricula_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Matrícula de Asignaturas")),
      body: EstudianteMatriculaView(),
    );
  }
}

class EstudianteMatriculaView extends StatefulWidget {
  const EstudianteMatriculaView({super.key});

  @override
  State<EstudianteMatriculaView> createState() =>
      _EstudianteMatriculaViewState();
}

class _EstudianteMatriculaViewState extends State<EstudianteMatriculaView> {
  List<InfoAsignatura> disponibles = [];
  List<InfoAsignatura> matriculadas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final api = ApiService();

      // Aquí cambias esta línea:
      // final List<InfoAsignatura> todas = await api.getAsignaturasDisponibles(widget.idPrograma);

      // Por tu nueva función sin parámetros:
      final List<InfoAsignatura> todas = await api
          .getAsignaturasDisponiblesEstudiante();

      // Asignaturas ya matriculadas por el estudiante
      final List<InfoAsignatura> inscritas = await api
          .getAsignaturasMatriculadas();

      // Filtrar las que no estén matriculadas
      final noMatriculadas = todas
          .where((a) => !inscritas.any((m) => m.id == a.id))
          .toList();

      setState(() {
        disponibles = noMatriculadas;
        matriculadas = inscritas;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());

    return RefreshIndicator(
      onRefresh: _loadData,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Asignaturas matriculadas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          if (matriculadas.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('No tienes asignaturas matriculadas actualmente.'),
            )
          else
            ...matriculadas.map(
              (a) => _AsignaturaCard(
                asignatura: a,
                matriculada: true,
                onRefresh: _loadData,
              ),
            ),

          const Divider(height: 32, thickness: 2),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Asignaturas disponibles para matricular',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          if (disponibles.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('No hay asignaturas disponibles para matricular.'),
            )
          else
            ...disponibles.map(
              (a) => _AsignaturaCard(
                asignatura: a,
                matriculada: false,
                onRefresh: _loadData,
              ),
            ),
          const SizedBox(height: 150),
        ],
      ),
    );
  }
}

class _AsignaturaCard extends StatefulWidget {
  final InfoAsignatura asignatura;
  final bool matriculada;
  final Future<void> Function() onRefresh;

  const _AsignaturaCard({
    required this.asignatura,
    required this.matriculada,
    required this.onRefresh,
  });

  @override
  State<_AsignaturaCard> createState() => _AsignaturaCardState();
}

class _AsignaturaCardState extends State<_AsignaturaCard> {
  bool isProcessing = false;
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final a = widget.asignatura;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              a.nombre,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Código: ${a.codigo}'),
            Text('Créditos: ${a.creditos}'),
            const SizedBox(height: 12),
            if (!widget.matriculada)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.how_to_reg, color: Colors.white),
                label: const Text(
                  'Matricular asignatura',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: isProcessing
                    ? null
                    : () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Confirmar matrícula'),
                            content: Text(
                              '¿Deseas matricular la asignatura "${a.nombre}"?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Matricular'),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          setState(() => isProcessing = true);
                          final exito = await apiService.matricularAsignatura(
                            a.id,
                          );
                          setState(() => isProcessing = false);

                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                exito
                                    ? 'Asignatura matriculada correctamente'
                                    : 'Error al matricular asignatura',
                              ),
                            ),
                          );
                          if (exito) await widget.onRefresh();
                        }
                      },
              )
            else
              Row(
                children: const [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text(
                    'Asignatura matriculada',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
