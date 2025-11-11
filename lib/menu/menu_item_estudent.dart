import 'package:flutter/material.dart';

class MenuItemEstudent {
  final String name;
  final String subTitle;
  final IconData icon;
  final String link;

  const MenuItemEstudent({required this.name, required this.subTitle, required this.icon, required this.link});

}

const appMenuItemsEstudent = <MenuItemEstudent>[
  MenuItemEstudent(name: 'Historico de notas', subTitle: 'Ver tu historico de notas', icon: Icons.school, link: '/estudiante/historico'),
  MenuItemEstudent(name: 'Matriculate', subTitle: 'Matriculate en una nueva aventura', icon: Icons.school, link: '/estudiante/matricular'),
];