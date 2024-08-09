import 'package:flutter/material.dart';

Color _primaryColor = const Color(0xFFE50914);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "NetflixSans",
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 18, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 32, color: Colors.white),
    labelMedium: TextStyle(color: Colors.white)
  ),
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: _primaryColor,
    primary: _primaryColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 18, 18, 18),
    selectedItemColor: Colors.white,
    unselectedItemColor: Color.fromARGB(255, 90, 90, 90),
    selectedIconTheme: IconThemeData(size: 30),
    unselectedIconTheme: IconThemeData(size: 30),
    selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
    unselectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all<Color>(Colors.white),
      overlayColor: WidgetStateProperty.all<Color>(Colors.white.withOpacity(0.2)),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
    ),
  ),
);
