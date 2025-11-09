import 'package:flutter/material.dart';

class MenuItemAdmin {
  final String name;
  final String subTitle;
  final IconData icon;
  final String link;

  const MenuItemAdmin({required this.name, required this.subTitle, required this.icon, required this.link});

}

const appMenuItemsAdmin = <MenuItemAdmin>[
  // MenuItemAdmin(name: 'Docentes', subTitle: 'Administrar docentes', icon: Icons.book, link: '/admin/profesores'),
  // MenuItemAdmin(name: 'Estudiantes', subTitle: 'Administrar estudiantes', icon: Icons.school, link: '/admin/profesores'),
  MenuItemAdmin(name: 'Programas', subTitle: 'Administrar programas', icon: Icons.school, link: '/admin/programas'),
  MenuItemAdmin(name: 'Asignaturas', subTitle: 'Administrar asignaturas', icon: Icons.school, link: '/admin/programas'),
  MenuItemAdmin(name: 'Semestres', subTitle: 'Administrar semestres', icon: Icons.school, link: '/admin/programas'),
];