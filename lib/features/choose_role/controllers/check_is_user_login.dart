import 'dart:developer';

import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:flutter/material.dart';

sealed class UserLogninState {}

class UserLoginInitialState extends UserLogninState {}

class UserLogninLoadingState extends UserLogninState {}

class UserLoginTrueSate extends UserLogninState {}

class UserLoginFalseState extends UserLogninState {}

class CheckIsUserLoginController extends ChangeNotifier {
  //...initialize the state
  UserLogninState _userLoginFalseState = UserLoginInitialState();
  UserLogninState get state => _userLoginFalseState;
  void _setState(UserLogninState state) {
    _userLoginFalseState = state;
    notifyListeners();
  }

  //..make the services objects
  final SessionManageService _sessionManageService = SessionManageService();
  void checkIsUserLogin() async {
    try {
      _setState(UserLogninLoadingState());
      bool? isUserLogin = await _sessionManageService.isUserSignedIn();
      log(isUserLogin.toString());
      switch (isUserLogin) {
        case null:
          _setState(UserLoginFalseState());
        case true:
          _setState(UserLoginTrueSate());
        case false:
          _setState(UserLoginFalseState());
      }
    } catch (e) {
      log(e.toString());
      _setState(UserLoginFalseState());
    }
  }
}
