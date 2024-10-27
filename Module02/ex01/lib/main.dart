import 'package:flutter/material.dart';
import 'package:weatherappv2proj/pages/home/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey[900]!,
          primary: Colors.black,
          secondary: Colors.grey[900],
          error: Colors.red,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.grey,
          selectionHandleColor: Colors.grey,
        ),
        useMaterial3: true,
      ),
      home: const DefaultTabController(
        length: 3,
        child: HomePage(),
      ),
    );
  }
}
