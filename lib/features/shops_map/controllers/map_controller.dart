import 'dart:async';
import 'dart:developer';

import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_constants.dart';
import 'package:aislecheck/core/services/location_service.dart';
import 'package:aislecheck/features/shops_geo_location/models/info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapControllerVariables {
  static final List<LatLng> _polylineCoordinates = [];
  static final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static final Set<Polyline> _polyLines = {};
  static final Set<Marker> _markers = {};

  static LatLng _currentPosition =
      const LatLng(37.43296265331129, -122.08832357078792);

  static final CameraPosition _cameraPosition = CameraPosition(
      target: _currentPosition,
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
}

class MapController extends ChangeNotifier {
  bool loadingState = true;
  bool loadedState = false;
  bool errorSate = false;
  String errorMesage = 'Something went wrong';

  GoogleMap? googleMap;

  final LocationService _locationService = LocationService();

  //...draw the polyline
  void addPolyLinePoints({required InfoWindowClass infoWindowClass}) async {
    try {
      loadingState = true;
      MapControllerVariables._currentPosition = LatLng(
          infoWindowClass.originLatitude, infoWindowClass.originLongitude);
      _currentLocationMarker();
      _getGoogleMap();
      MapControllerVariables._polylineCoordinates.clear();
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: AppConstants.mapApiKey,
        request: PolylineRequest(
          origin: PointLatLng(
              infoWindowClass.originLatitude, infoWindowClass.originLongitude),
          destination: PointLatLng(
              infoWindowClass.destLatitude, infoWindowClass.destLongitude),
          mode: TravelMode.driving,
          alternatives: true,
        ),
      );
      log(result.points.toString());
      for (var element in result.points) {
        MapControllerVariables._polylineCoordinates.add(
          LatLng(element.latitude, element.longitude),
        );
      }
      var endCap = await BitmapDescriptor.asset(
          const ImageConfiguration(
            size: Size(50, 50),
          ),
          CustmoerImages.bullet);
      Polyline polyline = Polyline(
        width: 5,
        polylineId: const PolylineId('polyline_id'),
        points: MapControllerVariables._polylineCoordinates,
        endCap: Cap.customCapFromBitmap(endCap),
      );
      MapControllerVariables._polyLines.add(polyline);
      loadingState = false;
      loadedState = true;
    } catch (e) {
      loadingState = false;
      loadedState = false;
      errorSate = true;
      log(e.toString());
    }
    notifyListeners();
  }

  //...take the google map
  void _getGoogleMap() {
    googleMap = GoogleMap(
      initialCameraPosition: MapControllerVariables._cameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      trafficEnabled: true,
      // tiltGesturesEnabled: false,
      onMapCreated: (controller) {
        MapControllerVariables._controller.complete(controller);
      },
      markers: MapControllerVariables._markers,
      polylines: MapControllerVariables._polyLines,
    );
  }

  //-> create the method that is add the marker
  //-> on the current location
  void _currentLocationMarker() async {
    String? locationName = await _locationService.getLocationName(
        MapControllerVariables._currentPosition.latitude,
        MapControllerVariables._currentPosition.longitude);
    MapControllerVariables._markers.add(
      Marker(
        markerId: const MarkerId('current location'),
        position: MapControllerVariables._currentPosition,
        infoWindow:
            InfoWindow(title: 'Current location', snippet: locationName),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    MapControllerVariables._polyLines.clear();
    MapControllerVariables._polyLines.clear();
  }
}
