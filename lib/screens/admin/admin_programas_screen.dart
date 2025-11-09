import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_academico/models/info_programa.dart';
import 'package:sistema_academico/services/api_service.dart';

class AdminProgramasScreen extends StatelessWidget {
  const AdminProgramasScreen({super.key});
  static String name = 'admin_programas_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Programas"),
      ),
      body: const AdminProgramasView(),
    );
  }
}

class AdminProgramasView extends StatefulWidget {
  const AdminProgramasView({super.key});

  @override
  State<AdminProgramasView> createState() => _AdminProgramasViewState();
}

class _AdminProgramasViewState extends State<AdminProgramasView> {
  List<InfoPrograma> programas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProgramas();
  }

  Future<void> _loadProgramas() async {
    try {
      final data = await ApiService().getProgramas();
      setState(() {
        programas = data;
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

    if (programas.isEmpty) {
      return const Center(child: Text("No hay programas disponibles"));
    }

    return ListView.builder(
      itemCount: programas.length,
      itemBuilder: (context, index) {
        final programa = programas[index];
        return _CustomListTile(menuItem: programa);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final InfoPrograma menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          // ignore: deprecated_member_use
          color: colors.primary.withOpacity(0.3),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
        title: Text(
          menuItem.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(menuItem.description),
        onTap: () {
          context.push('/admin/programa', extra: menuItem);
        },
      ),
    );
  }
}

