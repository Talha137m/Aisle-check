import 'dart:developer';

import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:flutter/material.dart';

sealed class AdminLogninState {}

class AdminLogninLoadingState extends AdminLogninState {}

class AdminLoginInitialState extends AdminLogninState {}

class AdminLoginTrueSate extends AdminLogninState {}

class AdminLoginFalseState extends AdminLogninState {}



class CheckIsAdminLoginController extends ChangeNotifier {
  //...initialize the state
  AdminLogninState _adminLoginFalseState = AdminLogninLoadingState();
  AdminLogninState get state => _adminLoginFalseState;
  void _setState(AdminLogninState state) {
    _adminLoginFalseState = state;
    notifyListeners();
  }

  //..make the services objects
  final SessionManageService _sessionManageService = SessionManageService();
  void checkIsAdminLogin() async {
    try {
      _setState(AdminLogninLoadingState());
      bool? isAdminLogin = await _sessionManageService.isAdminSignedIn();
      print('??????$isAdminLogin');
      log(isAdminLogin.toString());
      switch (isAdminLogin) {
        case null:
          _setState(AdminLoginFalseState());
        case true:
          _setState(AdminLoginTrueSate());
        case false:
          _setState(AdminLoginFalseState());
      }
    } catch (e) {
      log(e.toString());
      _setState(AdminLoginFalseState());
    }
  }
}
