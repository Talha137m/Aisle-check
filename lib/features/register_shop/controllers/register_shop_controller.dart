import 'dart:developer';
import 'dart:io';

import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:aislecheck/core/services/shop_service.dart';
import 'package:aislecheck/features/register_shop/models/shop.dart';
import 'package:flutter/material.dart';

//...create the states
@immutable
sealed class RegisterShopState {}

@immutable
class RegisterShopInitialState extends RegisterShopState {}

@immutable
class RegisterShopLoadingState extends RegisterShopState {}

@immutable
class RegisterShopLoadedState extends RegisterShopState {}

//...changenotifier class
class RegisterShopErrorState extends RegisterShopState {
  final String msg;
  RegisterShopErrorState({required this.msg});
}

class RegisterShopController extends ChangeNotifier {
  //....initialize the states

  RegisterShopState _state = RegisterShopInitialState();
  RegisterShopState get state => _state;
  void _setState(RegisterShopState state) {
    _state = state;
    notifyListeners();
  }

  //...controllers
  TextEditingController shopNameController = TextEditingController();

  //...services
  final SessionManageService _sessionManageService = SessionManageService();
  final ShopService _shopService = ShopService();
  void registerShop({required Shop shop}) async {
    try {
      String? adminId = _sessionManageService.getAdminUid();
      if (adminId == null) {
        _setState(RegisterShopErrorState(msg: 'something went wrong'));
        return;
      } else {
        _setState(RegisterShopLoadingState());
        await _shopService.addShop(
          shop: Shop(
            name: shop.name,
            rating: shop.rating,
            locationLatLang: shop.locationLatLang,
            imageUrl: shop.imageUrl,
            locationAddress: shop.locationAddress,
            shopId: adminId,
            boostAmount: shop.boostAmount,
            boostCount: shop.boostCount,
          ),
          id: adminId,
        );
        bool isShopRegister =
            await _sessionManageService.insertIsShopRegister(true);
        switch (isShopRegister) {
          case true:
            _setState(RegisterShopLoadedState());
          case false:
            _setState(RegisterShopErrorState(msg: 'Something went wrong'));
        }
      }
    } on SocketException catch (e) {
      log(e.toString());
      _setState(RegisterShopErrorState(msg: 'Not connected to internet'));
    } catch (e) {
      _setState(RegisterShopErrorState(msg: 'Something went wrong'));
    }
  }

  void registerShopInitialState() {
    _setState(RegisterShopInitialState());
  }

  @override
  void dispose() {
    super.dispose();
    shopNameController.dispose();
  }
}
