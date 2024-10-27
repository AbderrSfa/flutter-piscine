import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weatherappv2proj/pages/search/models/location.dart';

Future<List<Location>> getLocations(String query) async {
  if (query.length < 3) {
    return [];
  }
  List<Location> suggestions = [];
  Uri uri = Uri.https('geocoding-api.open-meteo.com', 'v1/search',
      {'name': query, 'count': '15'});
  Response response = await http.get(uri);
  dynamic data = jsonDecode(response.body.toString());
  if (response.statusCode == 200 && data['results'] != null) {
    for (Map<String, dynamic> location in data['results']) {
      suggestions.add(Location.fromMap(location));
    }
    return suggestions;
  }
  return suggestions;
}

void  getWeather(Location location) async {
  
}