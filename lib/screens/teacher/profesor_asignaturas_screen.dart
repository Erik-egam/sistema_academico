import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_academico/models/info_asignatura.dart';
import 'package:sistema_academico/services/api_service.dart';

class ProfesorAsignaturasScreen extends StatelessWidget {
  const ProfesorAsignaturasScreen({super.key});

  static String name = 'profesor_asignaturas_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mis Asignaturas")),
      body: const ProfesorAsignaturasView(),
    );
  }
}

class ProfesorAsignaturasView extends StatefulWidget {
  const ProfesorAsignaturasView({super.key});

  @override
  State<ProfesorAsignaturasView> createState() =>
      _ProfesorAsignaturasViewState();
}

class _ProfesorAsignaturasViewState extends State<ProfesorAsignaturasView> {
  List<InfoAsignatura> asignaturas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final api = ApiService();
      final List<InfoAsignatura> data = await api
          .getAsignaturasDictandoProfesor();

      setState(() {
        asignaturas = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: _loadData,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text(
            'Mis asignaturas habilitadas',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (asignaturas.isEmpty)
            const Text('No tienes asignaturas asignadas actualmente.')
          else
            ...asignaturas.map((a) => _AsignaturaCard(asignatura: a)),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _AsignaturaCard extends StatelessWidget {
  final InfoAsignatura asignatura;
  const _AsignaturaCard({required this.asignatura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        context.push('/profesor/detalle/asignatura',
        extra: asignatura
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                asignatura.nombre,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Código: ${asignatura.codigo}'),
              Text('Créditos: ${asignatura.creditos}'),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.book, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'Asignatura asignada',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

