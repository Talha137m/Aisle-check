import 'dart:developer';
import 'dart:io';

import 'package:aislecheck/core/services/location_service.dart';
import 'package:flutter/material.dart';

@immutable
sealed class CurrentLocatioState {}

@immutable
class CurrentLocationInitialState extends CurrentLocatioState {}

@immutable
class CurrentLocationLoadingState extends CurrentLocatioState {}

@immutable
class CurrentLocationLoadedState extends CurrentLocatioState {
  final String locationname;
  final num latitude, longitude;
  CurrentLocationLoadedState(
      {required this.locationname,
      required this.latitude,
      required this.longitude});
}

@immutable
class CurretLocationErrorState extends CurrentLocatioState {
  final String msg;
  CurretLocationErrorState({required this.msg});
}

class CurrentLocationController extends ChangeNotifier {
  CurrentLocatioState _state = CurrentLocationInitialState();

  CurrentLocatioState get state => _state;

  void _setState(CurrentLocatioState newState) {
    _state = newState;
    notifyListeners();
  }

  //....constants
  static const _emptyNameFieldErrormsg = 'field should not empty';
  //.........forms validation
  String? isEmptyForm(String? value) {
    if (value != null) {
      return null;
    } else {
      return _emptyNameFieldErrormsg;
    }
  }

  //...controllers
  TextEditingController shopLocationController = TextEditingController();
  //...servuces
  final LocationService _locationService = LocationService();
  void findCurrentLocation() async {
    try {
      _setState(CurrentLocationLoadingState());
      LocationInitialization locationInitialization =
          await _locationService.initializeLocation();
      switch (locationInitialization.latlang == null) {
        case true:
          _setState(CurretLocationErrorState(
              msg: locationInitialization.errorMesage));
        case false:
          double latiTude = locationInitialization.latlang!.$1;
          double longitude = locationInitialization.latlang!.$2;
          String? locationName =
              await _locationService.getLocationName(latiTude, longitude);
          _setState(
            CurrentLocationLoadedState(
                locationname: locationName ?? 'location not found',
                latitude: latiTude,
                longitude: longitude),
          );
      }
    } on SocketException catch (e) {
      log(e.toString());
      _setState(CurretLocationErrorState(msg: 'Not connected to internet'));
    } catch (e) {
      log(e.toString());
      _setState(CurretLocationErrorState(msg: e.toString()));
    }
  }
}
