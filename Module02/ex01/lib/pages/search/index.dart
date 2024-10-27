import 'package:flutter/material.dart';
import 'package:weatherappv2proj/components/search/location_suggestion_item.dart';
import 'package:weatherappv2proj/components/search/location_weather.dart';
import 'package:weatherappv2proj/pages/search/models/location.dart';
import 'package:weatherappv2proj/pages/search/services/api_calls.dart';

class MySearchDelegate extends SearchDelegate {
  Location _location = Location();

  @override
  List<Widget>? buildActions(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.clear,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(
        Icons.chevron_left,
        color: theme.colorScheme.onPrimary,
        size: 28,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return LocationWeather(
      location: _location,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final titleStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: FutureBuilder<List<Location>>(
        future: getLocations(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.onPrimary,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            if (query.length < 3) {
              return Center(
                child: Text(
                  "Search for a location to see weather",
                  style: titleStyle,
                  textAlign: TextAlign.center,
                ),
              );
            }
            return Center(
              child: Text(
                "Can't find whatever you're looking for",
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.all(12),
                color: theme.colorScheme.secondary,
                child: ListView.separated(
                  itemBuilder: (context, index) => SuggestionItem(
                      suggestion: snapshot.data![index],
                      onTap: () =>
                          _onSuggestionTap(context, snapshot.data![index])),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Divider(color: theme.colorScheme.onPrimary),
                  ),
                  itemCount: snapshot.data!.length,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  PreferredSize? buildBottom(BuildContext context) => const PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: SizedBox(
          height: 10,
        ),
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
        titleLarge: TextStyle(
          color: colorScheme.onPrimary,
        ),
      ),
      scaffoldBackgroundColor: colorScheme.primary,
      hintColor: colorScheme.onPrimary,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.secondary,
      ),
    );
  }

  void _onSuggestionTap(BuildContext context, Location suggestion) {
    debugPrint("Tapped on suggestion: ${suggestion.name}");
    _location = Location(
      name: suggestion.name,
      admin1: suggestion.admin1,
      country: suggestion.country,
      latitude: suggestion.latitude,
      longitude: suggestion.longitude,
    );
    showResults(context);
  }
}
