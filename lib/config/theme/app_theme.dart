import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.teal,
  Colors.pink,
  Colors.purple,
  Colors.orange
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be grater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
