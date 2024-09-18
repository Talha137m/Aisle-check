// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocationLatLang {
  final num latitude;
  final num longitude;
  const LocationLatLang({
    required this.latitude,
    required this.longitude,
  });

  LocationLatLang copyWith({
    num? latitude,
    num? longitude,
  }) {
    return LocationLatLang(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LocationLatLang.fromMap(Map<String, dynamic> map) {
    return LocationLatLang(
      latitude: map['latitude'] as num,
      longitude: map['longitude'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationLatLang.fromJson(String source) =>
      LocationLatLang.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LocationLatLang(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant LocationLatLang other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
