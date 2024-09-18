import 'dart:io';
import 'dart:developer' as log;
import 'package:aislecheck/core/services/firestorage_service.dart';
import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@immutable
sealed class ShopImagePickerStates {}

@immutable
class ShopImagePickerInitialState extends ShopImagePickerStates {}

@immutable
class ShopImagePickerLoadingState extends ShopImagePickerStates {}

@immutable
class ShopImagePickerEmptyState extends ShopImagePickerStates {}

@immutable
class ShopImagePickerLoadedState extends ShopImagePickerStates {
  final File image;
  final String imageUrl;
  final String shopId;
  ShopImagePickerLoadedState(
      {required this.image, required this.imageUrl, required this.shopId});
}

@immutable
class ShopImagePickerErrorState extends ShopImagePickerStates {
  final String msg;
  ShopImagePickerErrorState({required this.msg});
}

class ShopImagePickerController extends ChangeNotifier {
  ShopImagePickerStates _state = ShopImagePickerInitialState();

  ShopImagePickerStates get state => _state;

  void _setState(ShopImagePickerStates newState) {
    _state = newState;
    notifyListeners();
  }

  //...services
  final FirestorageService _firestorageService = FirestorageService();
  final SessionManageService _sessionManageService = SessionManageService();

  void pickImageFromGallery() async {
    _setState(ShopImagePickerLoadingState());
    try {
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      String? adminUid = await _sessionManageService.getAdminUid();
      if (pickedImage != null && adminUid != null) {
        File image = File(pickedImage.path);

        String imageUrl =
            await _firestorageService.uploadShopImg(adminUid, image);
        _setState(ShopImagePickerLoadedState(
            image: image, imageUrl: imageUrl, shopId: adminUid));
      } else {
        _setState(ShopImagePickerEmptyState());
      }
    } on SocketException catch (e) {
      log.log(e.toString());
      _setState(ShopImagePickerErrorState(msg: 'Not connected to internet'));
    } catch (e) {
      _setState(ShopImagePickerErrorState(msg: 'Something went wrong'));
      log.log(e.toString());
    }
  }
}
