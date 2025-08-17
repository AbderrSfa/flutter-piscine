import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _text = 'A simple text';

  void _setText() {
    setState(() {
      _text == 'A simple text'
          ? _text = 'Hello World!'
          : _text = 'A simple text';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.displaySmall;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _text,
                style: titleStyle?.copyWith(color: theme.colorScheme.onPrimary),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _setText(),
              child: const Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}
