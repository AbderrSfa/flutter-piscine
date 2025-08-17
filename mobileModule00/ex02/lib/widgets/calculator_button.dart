import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final bool isOperator;
  final bool isSpecial;
  final double flex;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOperator = false,
    this.isSpecial = false,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor = Colors.white;

    if (isSpecial) {
      backgroundColor = Theme.of(
        context,
      ).colorScheme.primary; // Orange for C, AC, =
    } else if (isOperator) {
      backgroundColor = Theme.of(
        context,
      ).colorScheme.secondaryContainer; // Gray for operators
    } else {
      backgroundColor = Theme.of(
        context,
      ).colorScheme.secondary; // Dark for numbers
    }

    return Expanded(
      flex: flex.toInt(),
      child: Container(
        margin: const EdgeInsets.all(4),
        child: AspectRatio(
          aspectRatio: flex > 1 ? 2.2 : 1.1,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 2,
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
