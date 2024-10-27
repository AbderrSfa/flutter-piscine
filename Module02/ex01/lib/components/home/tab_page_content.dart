import 'package:flutter/material.dart';

class TabPageContent extends StatelessWidget {
  const TabPageContent(
      {super.key,
      required this.tabTitle,
      required this.coordinates,
      required this.errorMessage});
  final String tabTitle;
  final String coordinates;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final subtitleStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final errorStyle = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.error,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: errorStyle,
                textAlign: TextAlign.center,
              )
            else ...[
              Text(tabTitle, style: titleStyle),
              Text(coordinates, style: subtitleStyle)
            ]
          ],
        ),
      ),
    );
  }
}
