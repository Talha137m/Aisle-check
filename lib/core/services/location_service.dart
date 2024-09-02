// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationService {
  static LocationService? _locationService;
  LocationService._internal();
  factory LocationService() {
    return _locationService ??= LocationService._internal();
  }
  final Location _location = Location();

  //------------create the method that
  //------------check location service is enabled or not
  Future<bool> checklocationService() async {
    bool isEnable = await _location.serviceEnabled();
    if (!isEnable) {
      isEnable = await _location.requestService();
      if (!isEnable) {
        log('location is disenable please enable');
      }
    }
    return isEnable;
  }

  //------------create the method that take the
  //------------location permission
  Future<bool> locationPermission() async {
    var permissionGranted = await _location.requestPermission();
    switch (permissionGranted) {
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.grantedLimited:
        return false;
      case PermissionStatus.denied:
        return false;
      case PermissionStatus.deniedForever:
        return false;
      default:
        return false;
    }
  }

  //------------get the current location
  //------------of the user
  Future<(double?, double?)> getLocation() async {
    LocationData locationData = await _location.getLocation();
    double? latude = locationData.latitude;
    double? longitude = locationData.longitude;
    return (latude, longitude);
  }

  //...calculate the distance how far
  double calculateDistance(LatLng start, LatLng end) {
    double distanceinMeters = Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );
    // Convert the distance to kilometers or miles as needed
    double distanceInKm = distanceinMeters / 1000;
    double roundedDistance = double.parse(distanceInKm.toStringAsFixed(2));
    return roundedDistance;
  }

  //..here is the method that is use to get the location name
  Future<String?> getLocationName(double latitude, double longitude) async {
    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(latitude, longitude);

    if (placemarks.isNotEmpty) {
      geocoding.Placemark place = placemarks[0];
      // the address based on your needs
      log(place.toString());
      String address =
          '${place.street}, ${place.subLocality}, ${place.administrativeArea}, ${place.country}';
      return address;
    } else {
      return null;
    }
  }

  Future<LocationInitialization> initializeLocation() async {
    bool isServiceEnable = await checklocationService();
    switch (isServiceEnable) {
      case true:
        bool isPermission = await locationPermission();
        switch (isPermission) {
          case true:
            var points = await getLocation();
            if (points.$1 != null && points.$2 != null) {
              return LocationInitialization(
                latlang: (points.$1!, points.$2!),
              );
            } else {
              return LocationInitialization(
                  latlang: null, errorMesage: 'location not found');
            }

          case false:
            return LocationInitialization(
                latlang: null,
                errorMesage:
                    'Location permission is not granted if don\'t ask permission again then go to the app setting and allow permission because permission is permanently denied');
        }

      case false:
        return LocationInitialization(
            latlang: null, errorMesage: 'Location servide is disabled');
    }
  }

  (double? latitude, double? longitude) changeLocation(Location location) {
    double? latitude, longitude;
    location.onLocationChanged.listen((LocationData currentLocation) {
      latitude = currentLocation.latitude;
      longitude = currentLocation.longitude;
    });
    return (latitude, longitude);
  }
}

class LocationInitialization {
  String errorMesage;

  (double latude, double longitude)? latlang;
  LocationInitialization({
    this.errorMesage = 'Something went wrong',
    this.latlang,
  });
}
