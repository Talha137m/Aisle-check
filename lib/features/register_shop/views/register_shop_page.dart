import 'dart:io';

import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/common/widgets/show_meesage_widget.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/common/widgets/upload_image_tile.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/register_shop/controllers/current_location_controller.dart';
import 'package:aislecheck/features/register_shop/controllers/shop_image_picker_controller.dart';
import 'package:aislecheck/features/shops_geo_location/controllers/shops_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterShopPage extends StatelessWidget {
  const RegisterShopPage({super.key});
  static const String name = '/registerShopPage';
  //.....CONTANT VALUES
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  static const _pointZeroFivePercent = 0.05;
  static const _btnText = 'Upload';
  static const _oneFlex = 1;
  static const _twoFlex = 2;
  static const _sevenFlex = 7;
  @override
  Widget build(BuildContext context) {
    ShopImagePickerController shopImagePickerController =
        context.watch<ShopImagePickerController>();
    CurrentLocationController currentLocationController =
        context.watch<CurrentLocationController>();
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GlobalAppBar(titleText: 'Ads'),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width * _pointZeroFivePercent),
        child: Column(
          children: [
            const Spacer(
              flex: _oneFlex,
            ),
            DataCollectionTextFormField(
              hintAndLabelText: 'Shop Name',
              keyboardType: TextInputType.text,
              validator: (value) {
                return null;
              },
              textEditingController: TextEditingController(),
            ),
            const Spacer(
              flex: _oneFlex,
            ),
            switch (currentLocationController.state) {
              CurrentLocationInitialState() => _currentLocationWidget(
                  currentLocationController: currentLocationController),
              CurrentLocationLoadingState() => const LoadingWidget(),
              CurrentLocationLoadedState() => _currentLocationWidget(
                  currentLocationController: currentLocationController,
                  currentLocation: (currentLocationController.state
                          as CurrentLocationLoadedState)
                      .locationname),
              CurretLocationErrorState() => UserMessage(
                  message: (currentLocationController.state
                          as CurretLocationErrorState)
                      .msg,
                  refresh: () {})
            },
            const Spacer(
              flex: _twoFlex,
            ),
            switch (shopImagePickerController.state) {
              ShopImagePickerInitialState() => _pickImage(
                  shopImagePickerController: shopImagePickerController),
              ShopImagePickerLoadingState() => const LoadingWidget(),
              ShopImagePickerLoadedState() => _pickImage(
                  shopImagePickerController: shopImagePickerController,
                  file: (shopImagePickerController.state
                          as ShopImagePickerLoadedState)
                      .image),
              ShopImagePickerErrorState() => UserMessage(
                  message: (shopImagePickerController.state
                          as ShopImagePickerErrorState)
                      .msg,
                  refresh: () {}),
              ShopImagePickerEmptyState() => _pickImage(
                  shopImagePickerController: shopImagePickerController),
            },
            const Spacer(
              flex: _sevenFlex,
            ),
            AppCompactBtn(
              onTap: () {
                context.showPopUpMsg('Item added');
                //showSnackBar(context, 'Item added');
              },
              borderRadius: _btnRadius,
              btnHeight: _btnHeight,
              btnName: _btnText,
              isTextBold: true,
            ),
            const Spacer(
              flex: _oneFlex,
            ),
          ],
        ),
      ),
    );
  }

  Widget _currentLocationWidget(
      {required CurrentLocationController currentLocationController,
      String currentLocation = 'currentLocation'}) {
    return DataCollectionTextFormField(
      hintAndLabelText: currentLocation,
      keyboardType: TextInputType.text,
      validator: (value) {
        return null;
      },
      textEditingController: TextEditingController(),
      isReadOnly: true,
      suffix: const Icon(Icons.location_on),
      onTab: () {
        currentLocationController.findCurrentLocation();
      },
    );
  }

  Widget _pickImage(
      {required ShopImagePickerController shopImagePickerController,
      File? file}) {
    return UploadImageTile(
      ontab: () {
        shopImagePickerController.pickImageFromGallery();
      },
      file: file,
    );
  }
}
