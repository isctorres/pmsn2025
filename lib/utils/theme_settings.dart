import 'package:flutter/material.dart';

class ThemeSettings {

  static ThemeData lightTheme(){
    final theme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.light, 
        primary: Colors.red, 
        onPrimary: Colors.amber, 
        secondary: Colors.amber, 
        onSecondary: Colors.amber, 
        error: Colors.amber, 
        onError: Colors.amber, 
        surface: Colors.black, 
        onSurface: Colors.amber, 
      )
    );
    return theme;
  }

  static ThemeData darkTheme(){
    final theme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark, 
        primary: Colors.grey, 
        onPrimary: Colors.amber, 
        secondary: Colors.amber, 
        onSecondary: Colors.amber, 
        error: Colors.amber, 
        onError: Colors.amber, 
        surface: Colors.black, 
        onSurface: Colors.amber, 
      )
    );
    return theme;
  }
  
}