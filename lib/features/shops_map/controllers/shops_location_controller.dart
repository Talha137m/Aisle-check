import 'dart:async';
import 'dart:developer';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/features/shops_map/controllers/shop_location_behaviour.dart';
import 'package:aislecheck/features/shops_map/models/dummy_shops_location.dart';
import 'package:aislecheck/features/shops_map/models/info_window.dart';
import 'package:aislecheck/features/shops_map/views/widgets/shops_location_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
//import 'package:location/location.dart';

class ShopsLocationController extends ChangeNotifier
    with ShopLocationBehaviour {
  //-----------create the google
  //----------- map states varibel
  bool initialState = true;
  bool loadingState = false;
  bool loadedState = false;
  bool errorState = false;

  //..take the context
  late BuildContext context;

  //......create the varibel that is show the
  //......error message
  String errorMesage = 'Something went Wrong';

  //.........create the map controller
  //.........object
  GoogleMapController? _mapcontroller;

  //......create the location class object
  final Location _location = Location();

  ///........create the variables for
  ///.......google map ✔✔✔✔✔
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  GoogleMap? googleMap;
  static double _cameraZoom = 10.0;

  static LatLng _currentPosition = const LatLng(0, 0);

  final List<LatLng> _polylineCoordinates = [];

  //➡➡➡➡➡ create the varible for custom info window

  bool _isInfoWindowVisible = false;
  OverlayEntry? _infoWindowOverlay;
  static CameraPosition cameraPosition =
      CameraPosition(target: _currentPosition, zoom: _cameraZoom);

  void mapInitialization(
      {double? targetLatude, double? targetLongitude}) async {
    initialState = false;
    loadedState = false;
    hideCustomInfoWindow();
    //loadingState = true;
    try {
      switch (await checklocationService(_location)) {
        case true:
          switch (await locationPermission(_location)) {
            case true:
              //..........call the method that is used to get the current location
              var points = await getLocation(_location);
              //...........to prevent the app craches we check that
              //...........corrdinated should not be null
              if (points.$1 != null && points.$2 != null) {
                //........assign the the current location to the global varible
                _currentPosition = LatLng(
                  points.$1!.round().toDouble(),
                  points.$2!.round().toDouble(),
                );
                //-> add the marker to the current position <-
                _currentLocationMarker();
                //.....here is the function is called
                //......that add the markers to the shops locations
                await _shopsLocationMarker();
                //......show the google map
                _getGoogleMap();
                //---now change the state
                if (targetLatude != null && targetLongitude != null) {
                  await _addPolyLinePoints(targetLatude, targetLongitude,
                      _currentPosition.latitude, _currentPosition.longitude);
                }
                loadingState = false;
                loadedState = true;
              } else {
                loadingState = false;
                errorState = true;
                errorMesage = 'current location is not find';
                log('current location is null');
              }

            case false:
              loadingState = false;
              errorState = true;
              errorMesage = 'please give the location permission';
              log('error: please give the location permission');
          }
        case false:
          loadingState = false;
          errorMesage = 'location service is not enabled please enabled first';
          log('error: location service is not enabled');
      }
    } catch (e) {
      loadingState = false;
      loadedState = false;
      errorState = true;
      log(e.toString());
    }

    notifyListeners();
  }

  //.....create the methos
  //.....that is initilazie the goggle map
  void _getGoogleMap() {
    googleMap = GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      trafficEnabled: true,
      tiltGesturesEnabled: false,
      onMapCreated: (controller) {
        _mapcontroller = controller;
      },
      markers: _markers,
      polylines: _polyLines,
      onTap: (argument) {
        hideCustomInfoWindow();
      },
      onCameraMove: (position) {
        if (_cameraZoom != position.zoom) {
          _cameraZoom = position.zoom;
          hideCustomInfoWindow();
        }
      },
      onCameraMoveStarted: () {
        hideCustomInfoWindow();
      },
    );
  }

  //.....create the methos that is show the custom
  //..... info windows
  void _showCustomInfoWindow(Widget child, BuildContext context) async {
    if (_isInfoWindowVisible) {
      hideCustomInfoWindow();
    } else {
      await _mapcontroller?.getScreenCoordinate(_currentPosition);

      _infoWindowOverlay = OverlayEntry(
        builder: (context) => Align(
          alignment: const Alignment(0.05, -0.6),
          child: child,
        ),
      );

      // ignore: use_build_context_synchronously
      Overlay.of(context).insert(_infoWindowOverlay!);
      _isInfoWindowVisible = true;
    }
  }

  //......create the methos
  //.....that is hide the custom info window
  void hideCustomInfoWindow() {
    if (_infoWindowOverlay != null) {
      _infoWindowOverlay!.remove();
      _infoWindowOverlay!.dispose();
      _infoWindowOverlay = null;
      _isInfoWindowVisible = false;
    }
  }

  //-> create the method that is add the marker
  //-> on the current location
  void _currentLocationMarker() {
    _markers.add(
      Marker(
        markerId: const MarkerId('current location'),
        position: _currentPosition,
        infoWindow: const InfoWindow(title: 'current location', snippet: ''),
        icon: BitmapDescriptor.defaultMarkerWithHue(12),
      ),
    );
  }

  //.......create the method that is add the markers to the
  //.......shops locations
  Future<void> _shopsLocationMarker() async {
    //.....here is the functions that is gives the location
    //.....of the shops that is registed by the shop owner
    AssetMapBitmap assetMapBitmap = await BitmapDescriptor.asset(
        const ImageConfiguration(
          size: Size(70, 60),
        ),
        AppImages.markerTag);
    //...here is add the markers
    for (var i = 0; i < shopsCenters.length; i++) {
      //.......here is we can calculate the distance
      //........between shop and user that is gives in meters
      double distanceInMeters = calculateDistance(_currentPosition,
          LatLng(shopsCenters[i].latitude, shopsCenters[i].longitude));

      //......marker tab
      void markTab() {
        _showCustomInfoWindow(
            ShopsLocationInfo(
              infoWindowClass: InfoWindowClass(
                shopName: shopsCenters[i].name,
                shopDistance: '$distanceInMeters km away',
                imagPath: shopsCenters[i].imgPath,
                originLatitude: _currentPosition.latitude,
                originLongitude: _currentPosition.longitude,
                destLatitude: shopsCenters[i].latitude,
                destLongitude: shopsCenters[i].longitude,
              ),
            ),
            context);
      }

      //.....here is make the object of the
      //....shop markers
      Marker shopMarker = Marker(
        markerId: MarkerId(shopsCenters[i].name),
        position: LatLng(
          shopsCenters[i].latitude,
          shopsCenters[i].longitude,
        ),
        icon: assetMapBitmap,
        onTap: markTab,
      );

      //...here is we can add the shop markers to
      //... the set of markers
      _markers.add(shopMarker);
    }
  }

  //.....here is the function that is
  //.....move the camera position the selected shop location
  void goToShopLocation(double latitude, double longitude) async {
    _polylineCoordinates.clear();
    _polyLines.clear();
    loadedState = false;
    loadingState = true;
    notifyListeners();

    _mapcontroller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
          tilt: 59.440717697143555,
          zoom: 13,
        ),
      ),
    );
    loadingState = false;
    loadedState = true;
    notifyListeners();
  }

  Future<void> _addPolyLinePoints(double originLatitude, double originLongitude,
      double destLatitude, double destLongitude) async {
    loadedState = false;
    loadingState = true;
    notifyListeners();
    _polylineCoordinates.clear();
    _polyLines.clear();

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: 'AIzaSyC9SFrATkFgXo-sN2cP-zFFi0NrYywjtNw',
      request: PolylineRequest(
        origin: PointLatLng(originLatitude, originLongitude),
        destination: PointLatLng(destLatitude, destLongitude),
        mode: TravelMode.driving,
        alternatives: true,
      ),
    );
    log(result.points.toString());
    for (var element in result.points) {
      _polylineCoordinates.add(
        LatLng(element.latitude, element.longitude),
      );
    }
    Polyline polyline = Polyline(
        width: 5,
        polylineId: const PolylineId('polyline_id'),
        points: _polylineCoordinates,
        endCap: Cap.squareCap);
    _polyLines.add(polyline);
    loadingState = false;
    loadedState = true;
  }

  @override
  void dispose() {
    _markers.clear();
    _polyLines.clear();
    super.dispose();
  }
}
