import 'dart:convert';

class Location {
  String? name;
  double? latitude;
  double? longitude;
  String? admin1;
  String? country;

  Location({
    this.name,
    this.latitude,
    this.longitude,
    this.admin1,
    this.country,
  });

  factory Location.fromMap(Map<String, dynamic> data) => Location(
        name: data['name'] as String?,
        latitude: (data['latitude'] as num?)?.toDouble(),
        longitude: (data['longitude'] as num?)?.toDouble(),
        admin1: data['admin1'] as String?,
        country: data['country'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'admin1': admin1,
        'country': country,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Location].
  factory Location.fromJson(String data) {
    return Location.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Location] to a JSON string.
  String toJson() => json.encode(toMap());
}
