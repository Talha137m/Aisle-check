import 'dart:developer';

import 'package:aislecheck/core/services/inventry_service.dart';
import 'package:aislecheck/features/add_inventory/models/inventry_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
sealed class FetchInventryStates {}

@immutable
class FetchInventryFirstBathLoadingState extends FetchInventryStates {}

@immutable
class FetchInventryNextBatchLoadingState extends FetchInventryStates {
  final List<InventryModel> products;
  FetchInventryNextBatchLoadingState({required this.products});
}

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
  FetchInventryStates _state = FetchInventryFirstBathLoadingState();
  FetchInventryStates get state => _state;
  void _setState(FetchInventryStates state) {
    _state = state;
    notifyListeners();
  }

  FetchInventryController() {
    fetchFirstBatch();
  }

  //...variables for pagination
  bool _hasMoreData = true;
  int _limit = 5;
  List<InventryModel> _firstBatchProducts = [];

  bool get hasMoreData => _hasMoreData;

  //...initialize the services
  final InventryService _inventryService = InventryService();

  void fetchFirstBatch() async {
    _setState(FetchInventryFirstBathLoadingState());
    try {
      _firstBatchProducts = await _inventryService.fetchInventry(limit: _limit);
      _hasMoreData = _firstBatchProducts.length == _limit;

      switch (_firstBatchProducts.isEmpty) {
        case true:
          _setState(FetchInventryNoDataState());
        case false:
          _setState(FetchInventryLoadedState(products: _firstBatchProducts));
      }
    } catch (e) {
      _setState(FetchInventryErrorState(msg: e.toString()));
    }
  }

  void fetchNextBatch() async {
    _setState(
        FetchInventryNextBatchLoadingState(products: _firstBatchProducts));
    try {
      _limit++;
      _firstBatchProducts = await _inventryService.fetchInventry(limit: _limit);
      _hasMoreData = _firstBatchProducts.length == _limit;
      switch (_firstBatchProducts.isEmpty) {
        case true:
          _setState(FetchInventryNoDataState());
        case false:
          _setState(FetchInventryLoadedState(products: _firstBatchProducts));
      }
    } catch (e) {
      _setState(FetchInventryErrorState(msg: e.toString()));
    }
  }
}
