import 'dart:io';
import 'dart:math';

import 'package:aislecheck/core/services/firestorage_service.dart';
import 'package:aislecheck/core/services/id_services.dart';
import 'package:aislecheck/core/services/inventry_service.dart';
import 'package:aislecheck/features/add_inventory/models/inventry_model.dart';
import 'package:flutter/material.dart';

@immutable
sealed class UploadInventryStates {}

@immutable
class UploadInventryInitialState extends UploadInventryStates {}

@immutable
class UploadInventryLoadingState extends UploadInventryStates {}

@immutable
class UploadInventryLoadedState extends UploadInventryStates {}

@immutable
class UploadInventryErrorState extends UploadInventryStates {
  final String msg;
  UploadInventryErrorState({required this.msg});
}

class UploadInventryController extends ChangeNotifier {
  //..initialize states
  UploadInventryStates _state = UploadInventryInitialState();
  UploadInventryStates get state => _state;
  void _setState(UploadInventryStates state) {
    _state = state;
    notifyListeners();
  }

  //....make the controller
  late TextEditingController productNameController;
  late TextEditingController productCategoryController;
  //...initialize into the constructor
  UploadInventryController() {
    productNameController = TextEditingController();
    productCategoryController = TextEditingController();
  }

  //...make the services objects
  final IdServices _idServices = IdServices();
  final FirestorageService _firestorageService = FirestorageService();
  final UploadInventryService _uploadInventryService = UploadInventryService();

  void uploadInventry(File image) async {
    _setState(UploadInventryLoadingState());
    try {
      String pId = _idServices.generateIdForProduct(productNameController.text);
      String url = await _firestorageService.uploadInventryImg(pId, image);
      if (productCategoryController.text.isNotEmpty &&
          productCategoryController.text.isNotEmpty) {
        bool isUploaded = await _uploadInventryService.uploadInventry(
            InventryModel(
                productName: productNameController.text,
                productCategory: productCategoryController.text,
                productImage: url,
                quantity: quantity,
                price: price,
                productId: pId,
                updatedAt: DateTime.now(),
                stockSituation: quantity < 10 ? 'Low stock' : ''));
        if (isUploaded) {
          _setState(UploadInventryLoadedState());
        } else {
          _setState(UploadInventryErrorState(msg: 'Something went wrong'));
        }
      } else {
        _setState(UploadInventryErrorState(msg: 'Please fill all fields'));
      }
    } on SocketException catch (e) {
      _setState(UploadInventryErrorState(msg: e.message));
    } catch (e) {
      _setState(UploadInventryErrorState(msg: e.toString()));
    }
  }

  //...initial values
  int quantity = 0;
  int price = 0;
  void incrementQuantity() {
    quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (quantity == 0) {
      return;
    } else {
      quantity--;
    }
    notifyListeners();
  }

  void incrementPrice() {
    price++;
    notifyListeners();
  }

  void decrementPrice() {
    if (price == 0) {
      return;
    } else {
      price--;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    productCategoryController.dispose();
  }
}
