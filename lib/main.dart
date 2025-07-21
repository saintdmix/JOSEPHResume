import 'package:flutter/material.dart';
import 'package:joseph_resume/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joseph Chukwuebuka Great - Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF0A0A0A),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 0,
        ),
        fontFamily: 'Courier',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00FF41),
            fontFamily: 'Courier',
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Courier',
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFFB0B0B0),
            fontFamily: 'Courier',
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color(0xFFB0B0B0),
            fontFamily: 'Courier',
          ),
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
