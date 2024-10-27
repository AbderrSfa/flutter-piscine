import 'package:ex03/data/constants.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {super.key,
      required this.button,
      required this.buttonPressed,
      required this.backgroundColor});
  final String button;
  final Function buttonPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final myTextStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 80,
      height: 80,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: operators.contains(button) || button == "=" || button == ""
                ? BorderSide.none
                : BorderSide(
                    width: 3,
                    color: theme.colorScheme.secondaryContainer,
                  ),
            backgroundColor: backgroundColor),
        onPressed: button != "" ? () => buttonPressed(button) : null,
        child: Text(
          button,
          style: myTextStyle,
        ),
      ),
    );
  }
}
