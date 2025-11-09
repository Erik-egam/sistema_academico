import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_academico/models/info_usuario.dart';
import 'package:sistema_academico/services/api_service.dart';

class AdminProfesoresScreen extends StatelessWidget {
  const AdminProfesoresScreen({super.key, required this.idPrograma});

  static String name = 'admin_profesores_screen';
  final int idPrograma;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profesores")),
      body: AdminProfesoresView(idPrograma: idPrograma),
    );
  }
}

class AdminProfesoresView extends StatefulWidget {
  final int idPrograma;
  const AdminProfesoresView({super.key, required this.idPrograma});

  @override
  State<AdminProfesoresView> createState() => _AdminProgramasViewState();
}

class _AdminProgramasViewState extends State<AdminProfesoresView> {
  List<InfoUsuario> profesores = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProgramas();
  }

  Future<void> _loadProgramas() async {
    try {
      final data = await ApiService().getProfesoresPrograma(widget.idPrograma);
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
      return const Center(child: Text("No hay profesores disponibles"));
    }

    return RefreshIndicator(
      onRefresh: _loadProgramas,
      child: ListView.builder(
        itemCount: profesores.length,
        itemBuilder: (context, index) {
          final profesor = profesores[index];
          return _CustomListTile(
            menuItem: profesor,
            onStatusChanged: _loadProgramas, // <- le pasamos la función
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
        // ignore: deprecated_member_use
        border: Border.all(color: widget.menuItem.activo ? colors.primary.withOpacity(0.3) : Colors.red.withOpacity(0.3), width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        trailing: widget.menuItem.activo
            ? Icon(Icons.check_circle, color: colors.primary)
            : Icon(Icons.cancel, color: Colors.red),
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
              // Volver a cargar la lista del padre
              await widget.onStatusChanged();
            }
          }
        },
      ),
    );
  }
}
