import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 0, 255, 242),
      surface: Colors.white,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),
    cardColor: Colors.white,
    scaffoldBackgroundColor: const Color.fromARGB(255, 215, 255, 249),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 0, 255, 242),
      foregroundColor: Colors.black,
      centerTitle: true,
    ),
    cardTheme: const CardThemeData(elevation: 6, shadowColor: Colors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      backgroundColor: Color.fromARGB(255, 0, 255, 242),
      selectedIconTheme: IconThemeData().copyWith(color: Colors.black),
      selectedLabelStyle: TextStyle(color: Colors.red, fontSize: 16),
      selectedItemColor: Colors.black,
    ),
    switchTheme: SwitchThemeData().copyWith(
      thumbColor: WidgetStateProperty.all(Color.fromARGB(255, 0, 255, 242)),
      trackColor: WidgetStatePropertyAll(Colors.blueGrey),
      trackOutlineColor: WidgetStatePropertyAll(Colors.blueGrey),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      surface: Color(0xFF1E1E1E),
      onPrimary: Colors.black,
      onSurface: Colors.black,
    ),
    cardColor: Colors.grey,
    scaffoldBackgroundColor: Colors.blueGrey,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black, foregroundColor: Colors.white, centerTitle: true),
    cardTheme: const CardThemeData(elevation: 6, shadowColor: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      backgroundColor: Colors.black,
      selectedIconTheme: IconThemeData().copyWith(color: Colors.white),
      selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 16),
      selectedItemColor: Colors.white,
    ),
    switchTheme: SwitchThemeData().copyWith(
      thumbColor: WidgetStateProperty.all(Colors.white),
      trackColor: WidgetStatePropertyAll(Colors.blueGrey),
      trackOutlineColor: WidgetStatePropertyAll(Colors.blueGrey),
    ),
  );
}
