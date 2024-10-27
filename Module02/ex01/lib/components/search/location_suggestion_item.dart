import 'package:flutter/material.dart';
import 'package:weatherappv2proj/pages/search/models/location.dart';

class SuggestionItem extends StatelessWidget {
  const SuggestionItem(
      {super.key, required this.suggestion, required this.onTap});
  final Location suggestion;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return ListTile(
        onTap: () => onTap(),
        title: RichText(
          text: TextSpan(
            style: titleStyle,
            children: [
              TextSpan(
                text: suggestion.name,
                style: titleStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ", ${suggestion.admin1}",
              ),
              TextSpan(
                text: ", ${suggestion.country}",
              ),
            ],
          ),
        ));
  }
}
