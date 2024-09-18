import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:flutter/material.dart';

sealed class ShopRegisterState {}

class ShopRegisterLoadingState extends ShopRegisterState {}

class ShopRegisterTrueState extends ShopRegisterState {}

class ShopRegisterFalseState extends ShopRegisterState {}

class CheckIsShopRegisterController extends ChangeNotifier {
  //...initialize the state
  ShopRegisterState _shopRegisterFalseState = ShopRegisterLoadingState();
  ShopRegisterState get state => _shopRegisterFalseState;
  void _setState(ShopRegisterState state) {
    _shopRegisterFalseState = state;
    notifyListeners();
  }

  //...create the objects of the services
  final SessionManageService _sessionManageService = SessionManageService();

  void isShopRegister() async {
    _setState(ShopRegisterLoadingState());
    bool? isShopRegister = await _sessionManageService.isShopRegister();
    switch (isShopRegister) {
      case null:
        _setState(ShopRegisterFalseState());
      case true:
        _setState(ShopRegisterTrueState());
      case false:
        _setState(ShopRegisterFalseState());
    }
  }
}
