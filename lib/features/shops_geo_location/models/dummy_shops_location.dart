// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aislecheck/core/constants/images_path.dart';

class ShopsCenter {
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String imgPath;
  ShopsCenter({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.imgPath,
  });

  ShopsCenter copyWith({
    String? name,
    String? address,
    double? latitude,
    double? longitude,
    String? imgPath,
  }) {
    return ShopsCenter(
      name: name ?? this.name,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      imgPath: imgPath ?? this.imgPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'imgPath': imgPath,
    };
  }

  factory ShopsCenter.fromMap(Map<String, dynamic> map) {
    return ShopsCenter(
      name: map['name'] as String,
      address: map['address'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      imgPath: map['imgPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopsCenter.fromJson(String source) => ShopsCenter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShopsCenter(name: $name, address: $address, latitude: $latitude, longitude: $longitude, imgPath: $imgPath)';
  }

  @override
  bool operator ==(covariant ShopsCenter other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.address == address &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.imgPath == imgPath;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      address.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      imgPath.hashCode;
  }
}

final List<ShopsCenter> shopsCenters = [
  ShopsCenter(
    imgPath: CustmoerImages.beautyImg,
    name: 'Student Safe Zone',
    address: 'Opposite side mela gali',
    latitude: 29.3807,
    longitude: 71.7182,
  ),
  ShopsCenter(
    imgPath: CustmoerImages.shop,
    name: 'McFit Neukölln',
    address: 'Tempelhofer Weg 91-99, 12347 Berlin',
    latitude: 52.4771,
    longitude: 13.4133,
  ),
  ShopsCenter(
    imgPath: CustmoerImages.beautyImg,
    name: 'Holmes Place Neue Welt',
    address: 'Hasenheide 109, 10967 Berlin',
    latitude: 52.4893,
    longitude: 13.4246,
  ),
  ShopsCenter(
    imgPath: CustmoerImages.onBoardingListing,
    name: 'Fit T9 Neukölln',
    address: 'Rollbergstraße 2-8, 12053 Berlin',
    latitude: 52.4771,
    longitude: 13.4321,
  ),
  ShopsCenter(
    imgPath: CustmoerImages.shop,
    name: 'Fit T9 Frauenfitness',
    address: 'Neckarstraße 24-26, 12053 Berlin',
    latitude: 52.4706,
    longitude: 13.4255,
  ),
  ShopsCenter(
    imgPath: CustmoerImages.shop,
    name: 'Flow Motion Studio',
    address: 'Glasower Str. 60, 12051 Berlin',
    latitude: 52.4838,
    longitude: 13.4433,
  ),
  ShopsCenter(
    imgPath: CustmoerImages.shop,
    name: 'American Fitness',
    address: 'Hermannplatz 10, 10967 Berlin',
    latitude: 52.4891,
    longitude: 13.4248,
  ),
  ShopsCenter(
    imgPath: CustmoerImages.shop,
    name: 'Gym80 Sportstudio',
    address: 'Lahnstraße 52, 12055 Berlin',
    latitude: 52.4876,
    longitude: 13.4600,
  ),
];
