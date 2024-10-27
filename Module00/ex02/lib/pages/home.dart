import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final myTextStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final buttons = [
      'AC',
      'C',
      '/',
      '',
      '1',
      '2',
      '3',
      '*',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '.',
      '0',
      '00',
      '='
    ];
    final operators = ['/', '*', '-', '+'];

    void buttonPressed(String buttonText) {
      debugPrint(buttonText);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: theme.colorScheme.secondary,
        foregroundColor: theme.colorScheme.onSecondary,
      ),
      backgroundColor: theme.colorScheme.tertiary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '0',
                    style: myTextStyle,
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    '0',
                    style: myTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 4,
                children: [
                  ...buttons.map(
                    (button) => OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: operators.contains(button) ||
                                button == "=" ||
                                button == "AC" ||
                                button == "C" ||
                                button == ""
                            ? BorderSide.none
                            : BorderSide(
                                width: 2,
                                color: theme.colorScheme.secondaryContainer,
                              ),
                        backgroundColor: button == "="
                            ? theme.colorScheme.primary
                            : (button == "AC" || button == "C")
                                ? theme.colorScheme.error
                                : operators.contains(button)
                                    ? theme.colorScheme.secondary
                                    : theme.colorScheme.tertiary,
                      ),
                      onPressed:
                          button != "" ? () => buttonPressed(button) : null,
                      child: Text(
                        button,
                        style: myTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
