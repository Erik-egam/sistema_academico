import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_academico/menu/menu_item_admin.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});
  static String name = 'admin_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panel de administracion"),
      ),
      body: AdminView()
      );
  }
}

class AdminView extends StatelessWidget {
  const AdminView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    appMenuItemsAdmin;
    return ListView.builder(
      itemCount: appMenuItemsAdmin.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItemsAdmin[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final MenuItemAdmin menuItem;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.name),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}

