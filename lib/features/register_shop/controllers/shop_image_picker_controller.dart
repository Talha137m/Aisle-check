import 'dart:io';

import 'dart:developer' as log;

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
  ShopImagePickerLoadedState({required this.image});
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

  void pickImageFromGallery() async {
    _setState(ShopImagePickerLoadingState());
    try {
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        File image = File(pickedImage.path);
        _setState(ShopImagePickerLoadedState(image: image));
      } else {
        _setState(ShopImagePickerEmptyState());
      }
    } catch (e) {
      _setState(ShopImagePickerErrorState(msg: 'Something went wrong'));
      log.log(e.toString());
    }
  }
}
