import 'dart:io';
import 'dart:developer' as log;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@immutable
sealed class InventryImagePickerStates {}

@immutable
class InventryImagePickerInitialState extends InventryImagePickerStates {}

@immutable
class InventryImagePickerLoadingState extends InventryImagePickerStates {}

@immutable
class InventryImagePickerEmptyState extends InventryImagePickerStates {}

@immutable
class InventryImagePickerLoadedState extends InventryImagePickerStates {
  final File image;
  InventryImagePickerLoadedState({
    required this.image,
  });
}

@immutable
class InventryImagePickerErrorState extends InventryImagePickerStates {
  final String msg;
  InventryImagePickerErrorState({required this.msg});
}

class UploadInventryImageController extends ChangeNotifier {
  InventryImagePickerStates _state = InventryImagePickerInitialState();

  InventryImagePickerStates get state => _state;

  void _setState(InventryImagePickerStates newState) {
    _state = newState;
    notifyListeners();
  }

  void pickImageFromGallery() async {
    _setState(InventryImagePickerLoadingState());
    try {
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        File image = File(pickedImage.path);

        _setState(InventryImagePickerLoadedState(image: image));
      } else {
        _setState(InventryImagePickerEmptyState());
      }
    } on SocketException catch (e) {
      log.log(e.toString());
      _setState(
          InventryImagePickerErrorState(msg: 'Not connected to internet'));
    } catch (e) {
      _setState(InventryImagePickerErrorState(msg: 'Something went wrong'));
      log.log(e.toString());
    }
  }
}
