// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:aislecheck/features/register_shop/models/location_lat_lang.dart';

class Shop {
  final String name;
  final num rating;
  final LocationLatLang locationLatLang;
  final String imageUrl;
  final String locationAddress;
  final String shopId;
  final String boostAmount;
  final num boostCount;
  Shop({
    required this.name,
    required this.rating,
    required this.locationLatLang,
    required this.imageUrl,
    required this.locationAddress,
    required this.shopId,
    required this.boostAmount,
    required this.boostCount,
  });

  Shop copyWith({
    String? name,
    num? rating,
    LocationLatLang? locationLatLang,
    String? imageUrl,
    String? locationAddress,
    String? shopId,
    String? boostAmount,
    num? boostCount,
  }) {
    return Shop(
      name: name ?? this.name,
      rating: rating ?? this.rating,
      locationLatLang: locationLatLang ?? this.locationLatLang,
      imageUrl: imageUrl ?? this.imageUrl,
      locationAddress: locationAddress ?? this.locationAddress,
      shopId: shopId ?? this.shopId,
      boostAmount: boostAmount ?? this.boostAmount,
      boostCount: boostCount ?? this.boostCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'rating': rating,
      'locationLatLang': locationLatLang.toMap(),
      'imageUrl': imageUrl,
      'locationAddress': locationAddress,
      'shopId': shopId,
      'boostAmount': boostAmount,
      'boostCount': boostCount,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      name: map['name'] as String,
      rating: map['rating'] as num,
      locationLatLang: LocationLatLang.fromMap(
          map['locationLatLang'] as Map<String, dynamic>),
      imageUrl: map['imageUrl'] as String,
      locationAddress: map['locationAddress'] as String,
      shopId: map['shopId'] as String,
      boostAmount: map['boostAmount'] as String,
      boostCount: map['boostCount'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) =>
      Shop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Shop(name: $name, rating: $rating, locationLatLang: $locationLatLang, imageUrl: $imageUrl, locationAddress: $locationAddress, shopId: $shopId, boostAmount: $boostAmount, boostCount: $boostCount)';
  }

  @override
  bool operator ==(covariant Shop other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.rating == rating &&
        other.locationLatLang == locationLatLang &&
        other.imageUrl == imageUrl &&
        other.locationAddress == locationAddress &&
        other.shopId == shopId &&
        other.boostAmount == boostAmount &&
        other.boostCount == boostCount;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        rating.hashCode ^
        locationLatLang.hashCode ^
        imageUrl.hashCode ^
        locationAddress.hashCode ^
        shopId.hashCode ^
        boostAmount.hashCode ^
        boostCount.hashCode;
  }
}
