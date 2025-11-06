import 'package:flutter/material.dart';
const colors = <Color>[
  Color.fromRGBO(56, 224, 122, 1),
  Colors.orangeAccent,
  Colors.teal,
  Colors.orange,
  Colors.pink,
  Colors.purple,
];




class AppTheme {
  final int selectedColor;
  AppTheme({
    this.selectedColor = 0
    }):assert(selectedColor >= 0, "Index color must be greater than or equal 0"),
    assert(selectedColor<colors.length, "Index color must be less than ${colors.length}");
  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        centerTitle: true,
      ),
      colorSchemeSeed: colors [selectedColor],
      brightness: Brightness.dark
    );
  }
}