import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                'A simple text',
                style: titleStyle?.copyWith(color: theme.colorScheme.onPrimary),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => debugPrint('Button pressed'),
              child: const Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}
