import 'package:ex03/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFEB6534),
            primary: const Color(0xFFEB6534),
            secondary: const Color(0xFF282828),
            tertiary: const Color(0xFF161616),
            secondaryContainer: const Color(0xFF383838)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
