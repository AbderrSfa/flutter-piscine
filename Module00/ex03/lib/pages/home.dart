import 'package:ex03/data/constants.dart';
import 'package:ex03/pages/components/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String entry = '';
  String answer = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final myTextStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    Color getColor(String button) {
      return button == "="
          ? theme.colorScheme.primary
          : operators.contains(button)
              ? theme.colorScheme.secondary
              : theme.colorScheme.tertiary;
    }

    void buttonPressed(String buttonText) {
      if (buttonText == '=') {
        try {
          Parser p = Parser();
          final parsedPhrase = p.parse(entry);
          ContextModel cm = ContextModel();

          setState(() {
            answer = parsedPhrase.evaluate(EvaluationType.REAL, cm).toString();
            entry = '';
          });
        } catch (e) {
          setState(() {
            answer = 'Invalid';
            entry = '';
          });
        }
      } else if (buttonText == 'AC') {
        entry = '';
        answer = '';
      } else if (buttonText == 'C') {
        if (entry.isNotEmpty) {
          entry = entry.substring(0, entry.length - 1);
        }
      } else {
        entry += buttonText;
      }
      setState(() {
        entry = entry;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: theme.colorScheme.secondary,
        foregroundColor: theme.colorScheme.onSecondary,
      ),
      backgroundColor: theme.colorScheme.tertiary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: SizedBox(
              width: 324,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    entry,
                    style: myTextStyle,
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    answer,
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
              padding: const EdgeInsets.only(bottom: 36),
              constraints: const BoxConstraints(minHeight: 324),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...buttons.sublist(0, 4).map(
                            (button) => CalculatorButton(
                              button: button,
                              buttonPressed: buttonPressed,
                              backgroundColor: getColor(button),
                            ),
                          ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...buttons.sublist(4, 8).map(
                            (button) => CalculatorButton(
                              button: button,
                              buttonPressed: buttonPressed,
                              backgroundColor: getColor(button),
                            ),
                          ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...buttons.sublist(8, 12).map(
                            (button) => CalculatorButton(
                              button: button,
                              buttonPressed: buttonPressed,
                              backgroundColor: getColor(button),
                            ),
                          ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...buttons.sublist(16, 20).map(
                            (button) => CalculatorButton(
                              button: button,
                              buttonPressed: buttonPressed,
                              backgroundColor: getColor(button),
                            ),
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
