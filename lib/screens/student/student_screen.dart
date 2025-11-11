import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_academico/menu/menu_item_estudent.dart';

class EstudianteScreen extends StatelessWidget {
  const EstudianteScreen({super.key});
  static String name = 'estudiante_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panel de estudiante"),
      ),
      body: EstudianteView()
      );
  }
}

class EstudianteView extends StatelessWidget {
  const EstudianteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    appMenuItemsEstudent;
    return ListView.builder(
      itemCount: appMenuItemsEstudent.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItemsEstudent[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final MenuItemEstudent menuItem;
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

