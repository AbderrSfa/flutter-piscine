import 'package:flutter/material.dart';
import 'package:weatherappv2proj/pages/search/models/location.dart';

class LocationWeather extends StatefulWidget {
  final Location location;

  const LocationWeather({super.key, required this.location});

  @override
  State<LocationWeather> createState() => _WeatherState();
}

class _WeatherState extends State<LocationWeather> {
  Location _location = Location();

  @override
  void initState() {
    super.initState();
    _location = widget.location;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final titleStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Center(
      child: Text(
        _location.latitude.toString(),
        style: titleStyle,
      ),
    );
  }
}
