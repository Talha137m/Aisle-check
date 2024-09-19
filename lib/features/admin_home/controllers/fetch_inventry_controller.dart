import 'package:aislecheck/core/services/inventry_service.dart';
import 'package:aislecheck/features/add_inventory/models/inventry_model.dart';
import 'package:flutter/material.dart';

@immutable
sealed class FetchInventryStates {}

@immutable
class FetchInventryLoadingState extends FetchInventryStates {}

@immutable
class FetchInventryLoadedState extends FetchInventryStates {
  final List<InventryModel> products;
  FetchInventryLoadedState({required this.products});
}

@immutable
class FetchInventryErrorState extends FetchInventryStates {
  final String msg;
  FetchInventryErrorState({required this.msg});
}

@immutable
class FetchInventryNoDataState extends FetchInventryStates {}

class FetchInventryController extends ChangeNotifier {
  //...initialize states
  FetchInventryStates _state = FetchInventryLoadingState();
  FetchInventryStates get state => _state;
  void _setState(FetchInventryStates state) {
    _state = state;
    notifyListeners();
  }

  //...initialize the services
  final UploadInventryService _uploadInventryService = UploadInventryService();
  void fetchInventry() async {
    _setState(FetchInventryLoadingState());
    try {
      final products = await _uploadInventryService.fetchInventry();
      switch (products.isEmpty) {
        case true:
          _setState(FetchInventryNoDataState());
        case false:
          _setState(FetchInventryLoadedState(products: products));
      }
    } catch (e) {
      _setState(FetchInventryErrorState(msg: e.toString()));
    }
  }
}
