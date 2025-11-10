import 'package:flutter/material.dart';
import 'package:sistema_academico/models/info_programa.dart';
import 'package:sistema_academico/models/info_usuario.dart';
import 'package:sistema_academico/services/api_service.dart';

class AdminEstudiantesScreen extends StatelessWidget {
  const AdminEstudiantesScreen({super.key, required this.idPrograma});

  static String name = 'admin_estudiantes_screen';
  final int idPrograma;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Estudiantes")),
      body: AdminEstudiantesView(idPrograma: idPrograma),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí abres el formulario de creación (o un diálogo, o una nueva pantalla)
          showDialog(
            context: context,
            builder: (context) =>
                _NuevoEstudianteDialog(idPrograma: idPrograma),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AdminEstudiantesView extends StatefulWidget {
  final int idPrograma;
  const AdminEstudiantesView({super.key, required this.idPrograma});

  @override
  State<AdminEstudiantesView> createState() => _AdminProgramasViewState();
}

class _AdminProgramasViewState extends State<AdminEstudiantesView> {
  List<InfoUsuario> profesores = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProgramas();
  }

  Future<void> _loadProgramas() async {
    try {
      final data = await ApiService().getEstudiantesPrograma(widget.idPrograma);
      setState(() {
        profesores = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (profesores.isEmpty) {
      return const Center(child: Text("No hay estudiantes disponibles"));
    }

    return RefreshIndicator(
      onRefresh: _loadProgramas,
      child: ListView.builder(
        itemCount: profesores.length,
        itemBuilder: (context, index) {
          final profesor = profesores[index];
          return _CustomListTile(
            menuItem: profesor,
            onStatusChanged: _loadProgramas,
          );
        },
      ),
    );
  }
}

class _CustomListTile extends StatefulWidget {
  const _CustomListTile({
    required this.menuItem,
    required this.onStatusChanged,
  });

  final InfoUsuario menuItem;
  final Future<void> Function() onStatusChanged;

  @override
  State<_CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<_CustomListTile> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final ApiService apiService = ApiService();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.menuItem.activo
              // ignore: deprecated_member_use
              ? colors.primary.withOpacity(0.3)
              // ignore: deprecated_member_use
              : Colors.red.withOpacity(0.3),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        trailing: widget.menuItem.activo
            ? Icon(Icons.check_circle, color: colors.primary)
            : const Icon(Icons.cancel, color: Colors.red),
        title: Text(
          '${widget.menuItem.name} ${widget.menuItem.lastName}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Email: ${widget.menuItem.email} (${widget.menuItem.activo ? "activo" : "inactivo"})',
        ),
        onTap: () async {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Confirmar acción'),
                content: Text(
                  '¿Estás seguro de que quieres ${widget.menuItem.activo ? 'desactivar' : 'activar'} este usuario?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(
                      'Sí, ${widget.menuItem.activo ? 'desactivar' : 'activar'}',
                    ),
                  ),
                ],
              );
            },
          );

          if (confirm == true) {
            final bool exito;
            if (widget.menuItem.activo) {
              exito = await apiService.eliminarUsuario(widget.menuItem.id);
            } else {
              exito = await apiService.activarUsuario(widget.menuItem.id);
            }

            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Usuario ${widget.menuItem.activo ? 'desactivado' : 'activado'} '
                  '${exito ? 'exitosamente' : 'fallidamente'}',
                ),
              ),
            );

            if (exito) {
              await widget.onStatusChanged();
            }
          }
        },
      ),
    );
  }
}

class _NuevoEstudianteDialog extends StatefulWidget {
  const _NuevoEstudianteDialog({required this.idPrograma});
  final int idPrograma;

  @override
  State<_NuevoEstudianteDialog> createState() => _NuevoEstudianteDialogState();
}

class _NuevoEstudianteDialogState extends State<_NuevoEstudianteDialog> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String nombre = '';
  String apellido = '';
  String email = '';

  final apiService = ApiService();
  List<InfoPrograma> programas = <InfoPrograma>[];
  Future<void> _opcionesPrograma() async {
    programas = await apiService.getProgramas();
    setState(() {
      programas;
    });
  }

  @override
  void initState() {
    _opcionesPrograma();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Crear nuevo estudiante'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Numero de documento',
                ),
                onChanged: (value) => id = value,
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
                decoration: const InputDecoration(labelText: 'Apellido'),
                onChanged: (value) => apellido = value,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                ),
                onChanged: (value) => email = value,
                validator: (value) => value == null || value.isEmpty
                    ? 'Campo obligatorio'
                    : value.endsWith("@ulibre.edu.co")
                    ? null
                    : "Debe finalizar con @ulibre.edu.co",
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final bool exito = await apiService.registrarUsuario(
                int.parse(id),
                nombre,
                apellido,
                email,
                widget.idPrograma,
                "EST",
              );

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    exito
                        ? 'estudiante creado exitosamente'
                        : 'Error al crear profesor',
                  ),
                ),
              );

              // ignore: use_build_context_synchronously
              if (exito) Navigator.pop(context, true);
            }
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
