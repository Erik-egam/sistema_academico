import 'package:flutter/material.dart';

class MenuItemProgramaAdmin {
  final String name;
  final String subTitle;
  final IconData icon;
  final String link;

  const MenuItemProgramaAdmin({
    required this.name,
    required this.subTitle,
    required this.icon,
    required this.link});
}

const appMenuItemsProgramasAdmin = <MenuItemProgramaAdmin>[
  MenuItemProgramaAdmin(name: 'Profesores', subTitle: 'Administrar profesores', icon: Icons.workspace_premium, link: '/admin/profesores/'),
  MenuItemProgramaAdmin(name: 'Estudiantes', subTitle: 'Administrar estudiantes', icon: Icons.workspace_premium, link: '/admin/estudiantes/'),
  MenuItemProgramaAdmin(name: 'Asignaturas', subTitle: 'Administrar asignaturas', icon: Icons.workspace_premium, link: '/admin/asignaturas/'),

];