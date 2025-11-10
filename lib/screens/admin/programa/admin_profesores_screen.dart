import 'package:flutter/material.dart';
import 'package:sistema_academico/models/info_asignatura.dart';
import 'package:sistema_academico/models/info_programa.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => _NuevoProfesorDialog(idPrograma: idPrograma),
          );
        },
        child: const Icon(Icons.add),
      ),
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
            idPrograma: widget.idPrograma,
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
    required this.idPrograma,
  });

  final InfoUsuario menuItem;
  final int idPrograma;
  final Future<void> Function() onStatusChanged;

  @override
  State<_CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<_CustomListTile> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

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
        trailing: PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) async {
            if (value == 'toggle') {
              await _cambiarEstado(context);
            } else if (value == 'asignar') {
              await showDialog(
                context: context,
                builder: (_) => _AsignarProfesorDialog(
                  profesor: widget.menuItem,
                  idPrograma: widget.idPrograma,
                ),
              );
            } else if (value == 'ver_asignaturas') {
              await showDialog(
                context: context,
                builder: (_) =>
                    _VerAsignaturasDialog(profesor: widget.menuItem),
              );
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'toggle',
              child: Text(widget.menuItem.activo ? 'Desactivar' : 'Activar'),
            ),
            const PopupMenuItem(
              value: 'asignar',
              child: Text('Asignar a asignatura'),
            ),
            const PopupMenuItem(
              value: 'ver_asignaturas',
              child: Text('Ver asignaturas asignadas'),
            ),
          ],
        ),

        title: Text(
          '${widget.menuItem.name} ${widget.menuItem.lastName}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Email: ${widget.menuItem.email} (${widget.menuItem.activo ? "activo" : "inactivo"})',
        ),
      ),
    );
  }

  Future<void> _cambiarEstado(BuildContext context) async {
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
      final bool exito = widget.menuItem.activo
          ? await apiService.eliminarUsuario(widget.menuItem.id)
          : await apiService.activarUsuario(widget.menuItem.id);

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
  }
}

class _NuevoProfesorDialog extends StatefulWidget {
  const _NuevoProfesorDialog({required this.idPrograma});
  final int idPrograma;

  @override
  State<_NuevoProfesorDialog> createState() => _NuevoProfesorDialogState();
}

class _NuevoProfesorDialogState extends State<_NuevoProfesorDialog> {
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
      title: const Text('Crear nuevo profesor'),
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
                  labelText:
                      'Correo electrónico: debe finalizar con @ulibre.edu.co',
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
                "PROF",
              );

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    exito
                        ? 'Profesor creado exitosamente'
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

class _AsignarProfesorDialog extends StatefulWidget {
  const _AsignarProfesorDialog({
    required this.profesor,
    required this.idPrograma,
  });
  final InfoUsuario profesor;
  final int idPrograma;
  @override
  State<_AsignarProfesorDialog> createState() => _AsignarProfesorDialogState();
}

class _AsignarProfesorDialogState extends State<_AsignarProfesorDialog> {
  final _formKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();

  int? _idAsignatura;
  List<InfoAsignatura> asignaturas = [];
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarAsignaturas();
  }

  Future<void> _cargarAsignaturas() async {
    try {
      asignaturas = await apiService.getAsignaturas(
        widget.idPrograma,
      ); // <-- asegúrate de tener este método
      setState(() {
        asignaturas;
        cargando = false;
      });
    } catch (e) {
      setState(() => cargando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Asignar ${widget.profesor.name} ${widget.profesor.lastName}',
      ),
      content: cargando
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: DropdownButtonFormField<int>(
                decoration: const InputDecoration(labelText: 'Asignatura'),
                items: asignaturas
                    .map(
                      (asig) => DropdownMenuItem<int>(
                        value: asig.id,
                        child: Text(asig.nombre),
                      ),
                    )
                    .toList(),
                onChanged: (value) => _idAsignatura = value,
                validator: (value) =>
                    value == null ? 'Selecciona una asignatura' : null,
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
              final exito = await apiService.asignarProfesorAsignatura(
                widget.profesor.id,
                _idAsignatura!,
              );

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    exito
                        ? 'Profesor asignado correctamente'
                        : 'Error al asignar profesor',
                  ),
                ),
              );
              // ignore: use_build_context_synchronously
              if (exito) Navigator.pop(context);
            }
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}

class _VerAsignaturasDialog extends StatefulWidget {
  final InfoUsuario profesor;
  const _VerAsignaturasDialog({required this.profesor});

  @override
  State<_VerAsignaturasDialog> createState() => _VerAsignaturasDialogState();
}

class _VerAsignaturasDialogState extends State<_VerAsignaturasDialog> {
  final ApiService apiService = ApiService();
  bool cargando = true;
  List<InfoAsignatura> asignaturas = [];

  @override
  void initState() {
    super.initState();
    _cargarAsignaturas();
  }

  Future<void> _cargarAsignaturas() async {
    try {
      asignaturas = await apiService.getAsignaturasProfesor(widget.profesor.id);
    } catch (e) {
      asignaturas = [];
    } finally {
      setState(() => cargando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Asignaturas de ${widget.profesor.name} ${widget.profesor.lastName}',
      ),
      content: SizedBox(
        width: 400,
        child: cargando
            ? const Center(child: CircularProgressIndicator())
            : asignaturas.isEmpty
            ? const Text('Este profesor no tiene asignaturas asignadas.')
            : ListView.builder(
                shrinkWrap: true,
                itemCount: asignaturas.length,
                itemBuilder: (context, index) {
                  final asig = asignaturas[index];
                  return ListTile(
                    title: Text(asig.nombre),
                    subtitle: Text('Código: ${asig.codigo}'),
                    leading: const Icon(Icons.book),
                  );
                },
              ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}
