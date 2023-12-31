import 'package:flutter/material.dart';

class Resources {
  static AppColors color = AppColors();
  static AppFonts font = AppFonts();
}

class AppColors {
  Color primaryBg = const Color(0xFFF6F8FC);
  Color background = const Color(0XFF323232);

  Color hightlight = const Color(0xFFFFE0A2);
  Color darkGrey = const Color(0xFF646464);
  Color blacky = const Color.fromARGB(0, 44, 48, 48);
  Color gradient = const Color(0xFFc93146);
}

class AppFonts {
  String primaryFont = 'Poppins';
}
