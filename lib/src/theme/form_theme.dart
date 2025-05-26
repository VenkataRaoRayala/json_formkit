import 'package:flutter/material.dart';

class FormTheme {
  final TextStyle labelStyle;
  final TextStyle errorStyle;
  final InputDecorationTheme inputDecorationTheme;
  final ButtonStyle buttonStyle;
  final Color backgroundColor;

  FormTheme({
    required this.labelStyle,
    required this.errorStyle,
    required this.inputDecorationTheme,
    required this.buttonStyle,
    required this.backgroundColor,
  });

  factory FormTheme.light() => FormTheme(
    labelStyle: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 16),
    errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
      errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    ),
    buttonStyle: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
      textStyle: const TextStyle(fontSize: 16),
    ),
    backgroundColor: Colors.white,
  );

  factory FormTheme.dark() => FormTheme(
    labelStyle: TextStyle(color: Colors.deepPurple.shade200, fontWeight: FontWeight.bold, fontSize: 16),
    errorStyle: TextStyle(color: Colors.red.shade200, fontSize: 12),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple.shade200)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red.shade200)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      fillColor: Colors.grey.shade800,
      filled: true,
    ),
    buttonStyle: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple.shade200,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
      textStyle: const TextStyle(fontSize: 16),
    ),
    backgroundColor: Colors.black,
  );
}
