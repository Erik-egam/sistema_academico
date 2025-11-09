import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_academico/menu/menu_item_programa_admin.dart';
import 'package:sistema_academico/models/info_programa.dart';

class AdminProgramaScreen extends StatelessWidget {
  final InfoPrograma programa;
  const AdminProgramaScreen({super.key, required this.programa});
  static String name = 'admin_programa_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(programa.name),
      ),
      body: AdminProgramaView(idPrograma: programa.id,)
      );
  }
}

class AdminProgramaView extends StatelessWidget {
  const AdminProgramaView({
    super.key, required this.idPrograma,
  });
  final int idPrograma;
  @override
  Widget build(BuildContext context) {
    appMenuItemsProgramasAdmin;
    return ListView.builder(
      itemCount: appMenuItemsProgramasAdmin.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItemsProgramasAdmin[index];
        return _CustomListTile(menuItem: menuItem, idPrograma: idPrograma,);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem, required this.idPrograma});
  final int idPrograma;
  final MenuItemProgramaAdmin menuItem;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.name),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        context.push('${menuItem.link}$idPrograma');
      },
    );
  }
}

