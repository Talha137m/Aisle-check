import 'dart:async';
import 'dart:developer';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_constants.dart';
import 'package:aislecheck/core/services/location_service.dart';
import 'package:aislecheck/features/shops_geo_location/models/dummy_shops_location.dart';
import 'package:aislecheck/features/shops_geo_location/models/info_window.dart';
import 'package:aislecheck/features/shops_geo_location/views/widgets/shops_location_info.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';

mixin DefineVariables {
  GoogleMapController? _mapcontroller;
  //......create the location class object

  ///.....markers
  final Set<Marker> _markers = {};
  //->  polylines ->
  final Set<Polyline> _polyLines = {};
  //-> ......camera zoom value ->
  double _cameraZoom = 10.0;
  //->  .....current position latitude and longitude  ->
  LatLng _currentPosition = const LatLng(0, 0);
  //....-> polyline coordinated for latitude and longitude ->

  //.....-> current locationname
  String? _locationname;
  //...check custom info window is show or not  ->
  bool _isInfoWindowVisible = false;
  //....for custom info window
  OverlayEntry? _infoWindowOverlay;
  //....initial camera position
  CameraPosition get _cameraPosition =>
      CameraPosition(target: _currentPosition, zoom: _cameraZoom);
}

class ShopsLocationController extends ChangeNotifier with DefineVariables {
  //-----------create the google
  //----------- map states varibel
  bool initialState = true;
  bool loadingState = false;
  bool loadedState = false;
  bool errorState = false;

  //..take the context
  late BuildContext context;
  GoogleMap? googleMap;

  //......create the varibel that is show the
  //......error message
  String errorMesage = 'Something went Wrong';

  final LocationService _locationService = LocationService();

  void mapInitialization() async {
    initialState = false;
    loadingState = true;
    try {
      LocationInitialization locationInitialization =
          await _locationService.initializeLocation();
      switch (locationInitialization.latlang == null) {
        case true:
          loadingState = false;
          errorState = true;
          errorMesage = locationInitialization.errorMesage;
        case false:
          _currentPosition = LatLng(locationInitialization.latlang!.$1,
              locationInitialization.latlang!.$2);
          _currentLocationMarker();
          _getGoogleMap();
          _shopsLocationMarker();
          loadedState = true;
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
      initialCameraPosition: _cameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      trafficEnabled: true,
      // tiltGesturesEnabled: false,
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
      onCameraMoveStarted: hideCustomInfoWindow,
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
      if (!context.mounted) return;
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
        infoWindow:
            InfoWindow(title: 'Current location', snippet: _locationname),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
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

      double distanceInMeters = _locationService.calculateDistance(
          _currentPosition,
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
    try {
      _polyLines.clear();
      loadedState = false;
      loadingState = true;
      notifyListeners();

      await _mapcontroller?.animateCamera(
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
    } catch (e) {
      loadedState = false;
      loadingState = false;
      errorState = true;
      log(e.toString());
    }

    notifyListeners();
  }

  //........clear the markers and polyline sets
  @override
  void dispose() {
    _markers.clear();
    _polyLines.clear();
    super.dispose();
  }
}
