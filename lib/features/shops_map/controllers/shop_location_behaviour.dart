import 'dart:developer';

import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

mixin ShopLocationBehaviour {
  //------------create the method that
  //------------check location service is enabled or not
  Future<bool> checklocationService(Location location) async {
    bool isEnable = await location.serviceEnabled();
    if (!isEnable) {
      isEnable = await location.requestService();
      if (!isEnable) {
        log('location is disenable please enable');
      }
    }
    return isEnable;
  }

  //------------create the method that take the
  //------------location permission
  Future<bool> locationPermission(Location location) async {
    var permissionGranted = await location.requestPermission();
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
  Future<(double?, double?)> getLocation(
    Location location,
  ) async {
    LocationData locationData = await location.getLocation();
    double? latude = locationData.latitude;
    double? longitude = locationData.longitude;
    return (latude, longitude);
  }

  (double? latitude, double? longitude) changeLocation(Location location) {
    double? latitude, longitude;
    location.onLocationChanged.listen((LocationData currentLocation) {
      latitude = currentLocation.latitude;
      longitude = currentLocation.longitude;
    });
    return (latitude, longitude);
  }

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

  Future<String?> getLocationName(double latitude, double longitude) async {
    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(latitude, longitude);

    if (placemarks.isNotEmpty) {
      geocoding.Placemark place = placemarks[0];
      // the address based on your needs
      String address =
          '${place.street}, ${place.administrativeArea}, ${place.country}';
      return address;
    } else {
      return null;
    }
  }
}
