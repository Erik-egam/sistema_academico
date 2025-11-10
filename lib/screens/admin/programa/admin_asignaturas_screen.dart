import 'package:flutter/material.dart';
import 'package:sistema_academico/models/info_asignatura.dart';
import 'package:sistema_academico/services/api_service.dart';

class AdminAsignaturasScreen extends StatelessWidget {
  const AdminAsignaturasScreen({super.key, required this.idPrograma});

  static String name = 'admin_asignaturas_screen';
  final int idPrograma;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestión de Asignaturas")),
      body: AdminAsignaturasView(idPrograma: idPrograma),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>
                _NuevaAsignaturaDialog(idPrograma: idPrograma),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Nueva Asignatura"),
      ),
    );
  }
}

class AdminAsignaturasView extends StatefulWidget {
  final int idPrograma;
  const AdminAsignaturasView({super.key, required this.idPrograma});

  @override
  State<AdminAsignaturasView> createState() => _AdminAsignaturasViewState();
}

class _AdminAsignaturasViewState extends State<AdminAsignaturasView> {
  List<InfoAsignatura> asignaturas = [];
  List<InfoAsignatura> asignaturasHabilitadas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final api = ApiService();
      // Petición 1: todas las asignaturas del programa
      final List<InfoAsignatura> todas = await api.getAsignaturasDisponibles(
        widget.idPrograma,
      );
      // Petición 2: asignaturas habilitadas (tabla relacional)
      final List<InfoAsignatura> habilitadas = await api.getAsignaturas(
        widget.idPrograma,
      );

      // Filtramos las que NO están habilitadas
      final noHabilitadas = todas
          .where((a) => !habilitadas.any((h) => h.id == a.id))
          .toList();

      setState(() {
        asignaturas = noHabilitadas;
        asignaturasHabilitadas = habilitadas;
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
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Asignaturas habilitadas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          if (asignaturasHabilitadas.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('No hay asignaturas habilitadas actualmente.'),
            )
          else
            ...asignaturasHabilitadas.map(
              (a) => _AsignaturaCard(
                asignatura: a,
                habilitada: true,
                onRefresh: _loadData,
              ),
            ),

          const Divider(height: 32, thickness: 2),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Asignaturas disponibles para habilitar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          if (asignaturas.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('No hay asignaturas disponibles para habilitar.'),
            )
          else 
            ...asignaturas.map(
              (a) => _AsignaturaCard(
                asignatura: a,
                habilitada: false,
                onRefresh: _loadData,
              ),
            ),
            SizedBox(height: 150,)
        ],
      ),
    );
  }
}

class _AsignaturaCard extends StatefulWidget {
  final InfoAsignatura asignatura;
  final bool habilitada;
  final Future<void> Function() onRefresh;

  const _AsignaturaCard({
    required this.asignatura,
    required this.habilitada,
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
    final asignatura = widget.asignatura;

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
              asignatura.nombre,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Código: ${asignatura.codigo}'),
            Text('Créditos: ${asignatura.creditos}'),
            const SizedBox(height: 12),
            if (!widget.habilitada)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 22,
                ),
                label: const Text(
                  'Habilitar asignatura',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: isProcessing
                    ? null
                    : () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Confirmar habilitación'),
                            content: Text(
                              '¿Deseas habilitar la asignatura "${asignatura.nombre}"?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Habilitar'),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          setState(() => isProcessing = true);
                          final exito = await apiService.habilitarAsignatura(
                            asignatura.id,
                          );

                          setState(() => isProcessing = false);
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                exito
                                    ? 'Asignatura habilitada correctamente'
                                    : 'Error al habilitar asignatura',
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
                    'Asignatura habilitada',
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

class _NuevaAsignaturaDialog extends StatefulWidget {
  const _NuevaAsignaturaDialog({required this.idPrograma});
  final int idPrograma;

  @override
  State<_NuevaAsignaturaDialog> createState() => _NuevaAsignaturaDialogState();
}

class _NuevaAsignaturaDialogState extends State<_NuevaAsignaturaDialog> {
  final _formKey = GlobalKey<FormState>();
  String codigo = '';
  String nombre = '';
  String creditos = '';
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Crear nueva asignatura'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Código'),
              onChanged: (value) => codigo = value,
              validator: (value) =>
                  value == null || value.isEmpty ? 'Campo obligatorio' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre'),
              onChanged: (value) => nombre = value,
              validator: (value) =>
                  value == null || value.isEmpty ? 'Campo obligatorio' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Créditos'),
              keyboardType: TextInputType.number,
              onChanged: (value) => creditos = value,
              validator: (value) =>
                  value == null || value.isEmpty ? 'Campo obligatorio' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.save),
          label: const Text('Guardar'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final exito = await apiService.registrarAsignatura(
                codigo,
                nombre,
                int.parse(creditos),
                widget.idPrograma,
              );

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    exito
                        ? 'Asignatura creada exitosamente'
                        : 'Error al crear asignatura',
                  ),
                ),
              );

              // ignore: use_build_context_synchronously
              if (exito) Navigator.pop(context, true);
            }
          },
        ),
      ],
    );
  }
}
