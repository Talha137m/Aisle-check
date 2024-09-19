import 'dart:developer';

import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:flutter/material.dart';

sealed class CheckChooseRoleState {}

class ChooseRoleLoadingState extends CheckChooseRoleState {}

class ChooseRoleInitialState extends CheckChooseRoleState {}

class AdminChooseRoleState extends CheckChooseRoleState {}

class UserChooseRoleState extends CheckChooseRoleState {}

class CheckChooseRoleErrorState extends CheckChooseRoleState {
  final String msg;
  CheckChooseRoleErrorState({required this.msg});
}

class CheckChooseRole extends ChangeNotifier {
  CheckChooseRoleState _state = ChooseRoleLoadingState();
  CheckChooseRoleState get state => _state;
  void _setState(CheckChooseRoleState state) {
    _state = state;
    notifyListeners();
  }

  //..make the services cllas
  final SessionManageService _sessionManageService = SessionManageService();
  void checkRole() async {
    try {
      _setState(ChooseRoleLoadingState());
      bool? isAdmin = await _sessionManageService.isAdminChooseRole();
      bool? isUser = await _sessionManageService.isUserChooseRole();
      if (isAdmin != null) {
        switch (isAdmin) {
          case true:
            _setState(AdminChooseRoleState());
          case false:
            _setState(ChooseRoleInitialState());
        }
      }
      else if (isUser != null) {
        switch (isUser) {
          case true:
            _setState(UserChooseRoleState());
          case false:
            _setState(ChooseRoleInitialState());
        }
      }
      else{
        _setState(ChooseRoleInitialState());
      }
    } catch (e) {
      log(e.toString());
      _setState(CheckChooseRoleErrorState(msg: 'something went wrong'));
    }
  }

  

  void insertRoleOfAdmin(bool insertAdminChooseRole) async {
    try {
      bool isInsert = await _sessionManageService
          .insertAdminChooseRole(insertAdminChooseRole);
      switch (isInsert) {
        case true:
          _setState(ChooseRoleLoadingState());
        case false:
          _setState(CheckChooseRoleErrorState(msg: 'Something went wrong'));
      }
    } catch (e) {
      log(e.toString());
      _setState(CheckChooseRoleErrorState(msg: 'Something went wrong'));
    }
  }

  void inserRoleOfUser(bool insertUserChooseRole) async {
    try {
      bool isInsert = await _sessionManageService
          .insertUserChooseRole(insertUserChooseRole);
      switch (isInsert) {
        case true:
          _setState(ChooseRoleLoadingState());
        case false:
          _setState(CheckChooseRoleErrorState(msg: 'Something went wrong'));
      }
    } catch (e) {
      log(e.toString());
      _setState(CheckChooseRoleErrorState(msg: 'Something went wrong'));
    }
  }

  void reinitializeState() {
    _setState(ChooseRoleLoadingState());
  }
}
