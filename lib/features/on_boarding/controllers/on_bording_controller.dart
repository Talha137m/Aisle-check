//...create the states
import 'dart:developer';

import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:flutter/material.dart';

sealed class SigninState {}

class SigninLoadingState extends SigninState {}

class SigninTrueState extends SigninState {}

class SinginFalseState extends SigninState {}

//..create the change notifier
class OnBordingController extends ChangeNotifier {
  //...check the states
  SigninState _signinState = SigninLoadingState();
  SigninState get state => _signinState;
  //...change the sate
  void _setState(SigninState state) {
    _signinState = state;
    notifyListeners();
  }

  ///..create the object of the session class
  final SessionManageService _sessionManageService = SessionManageService();

  void isSignin() async {
    try {
      _setState(SigninLoadingState());
      bool? isSignin = await _sessionManageService.isAdminSignedIn();
      log(isSignin.toString());
      switch (isSignin) {
        case null:
          _setState(SinginFalseState());
        case true:
          _setState(SigninTrueState());
        case false:
          _setState(SinginFalseState());
      }
    } catch (e) {
      _setState(SinginFalseState());
      log(e.toString());
    }
  }
}
