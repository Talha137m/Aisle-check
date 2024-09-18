import 'dart:developer';
import 'dart:io';

import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/error_msg_widget.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/common/widgets/show_meesage_widget.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/common/widgets/upload_image_tile.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/admin_home/views/admin_home_page.dart';
import 'package:aislecheck/features/register_shop/controllers/current_location_controller.dart';
import 'package:aislecheck/features/register_shop/controllers/register_shop_controller.dart';
import 'package:aislecheck/features/register_shop/controllers/shop_image_picker_controller.dart';
import 'package:aislecheck/features/register_shop/models/location_lat_lang.dart';
import 'package:aislecheck/features/register_shop/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterShopPage extends StatelessWidget {
  const RegisterShopPage({super.key});
  static const String name = '/registerShopPage';

  @override
  Widget build(BuildContext context) {
    RegisterShopController registerShopController =
        context.watch<RegisterShopController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GlobalAppBar(titleText: 'Ads'),
      body: switch (registerShopController.state) {
        RegisterShopInitialState() => const RegisterShopWidget(),
        RegisterShopLoadingState() => const LoadingWidget(),
        RegisterShopLoadedState() => AdminHomePage(),
        RegisterShopErrorState() => ErrorMessageWidget(
            title: (registerShopController.state as RegisterShopErrorState).msg,
          ),
      },
    );
  }
}

class RegisterShopWidget extends StatelessWidget {
  const RegisterShopWidget({super.key});
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
    RegisterShopController registerShopController =
        context.read<RegisterShopController>();
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    log(currentLocationController.state.toString());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * _pointZeroFivePercent),
      child: Column(
        children: [
          const Spacer(
            flex: _oneFlex,
          ),
          DataCollectionTextFormField(
            hintAndLabelText: 'Shop Name',
            keyboardType: TextInputType.text,
            validator: currentLocationController.isEmptyForm,
            textEditingController: registerShopController.shopNameController,
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
                refresh: () {
                  currentLocationController.findCurrentLocation();
                })
          },
          const Spacer(
            flex: _twoFlex,
          ),
          switch (shopImagePickerController.state) {
            ShopImagePickerInitialState() =>
              _pickImage(shopImagePickerController: shopImagePickerController),
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
                refresh: () {
                  shopImagePickerController.pickImageFromGallery();
                }),
            ShopImagePickerEmptyState() =>
              _pickImage(shopImagePickerController: shopImagePickerController),
          },
          const Spacer(
            flex: _sevenFlex,
          ),
          AppCompactBtn(
            onTap: () {
              _uploaTab(currentLocationController, registerShopController,
                  shopImagePickerController, context);
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
    );
  }

  void _uploaTab(
      CurrentLocationController currentLocationController,
      RegisterShopController registerShopController,
      ShopImagePickerController shopImagePickerController,
      BuildContext context) {
    bool isFieldsNotEmpty =
        currentLocationController.shopLocationController.text.isNotEmpty &&
            registerShopController.shopNameController.text.isNotEmpty;

    if (isFieldsNotEmpty) {
      switch (shopImagePickerController.state is ShopImagePickerLoadedState &&
          currentLocationController.state is CurrentLocationLoadedState) {
        case true:
          LocationLatLang locationLatLang = LocationLatLang(
              latitude: (currentLocationController.state
                      as CurrentLocationLoadedState)
                  .latitude,
              longitude: (currentLocationController.state
                      as CurrentLocationLoadedState)
                  .longitude);

          registerShopController.registerShop(
            shop: Shop(
                name: registerShopController.shopNameController.text,
                rating: 0,
                locationLatLang: locationLatLang,
                imageUrl: (shopImagePickerController.state
                        as ShopImagePickerLoadedState)
                    .imageUrl,
                locationAddress: (currentLocationController.state
                        as CurrentLocationLoadedState)
                    .locationname,
                shopId: (shopImagePickerController.state
                        as ShopImagePickerLoadedState)
                    .shopId,
                boostAmount: '0',
                boostCount: 0),
          );
        case false:
          context.showPopUpMsg('Not valid...Or May be one field empty');
      }
    } else {
      context.showPopUpMsg('Please fill all fields');
    }
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

  Widget _currentLocationWidget(
      {required CurrentLocationController currentLocationController,
      String currentLocation = ''}) {
    currentLocationController.shopLocationController.text = currentLocation;
    return DataCollectionTextFormField(
      hintAndLabelText: 'current location',
      keyboardType: TextInputType.text,
      validator: currentLocationController.isEmptyForm,
      textEditingController: currentLocationController.shopLocationController,
      // isReadOnly: true,
      suffix: _suffixWidget(currentLocationController),
    );
  }

  Widget _suffixWidget(CurrentLocationController currentLocationController) {
    return IconButton(
      onPressed: () {
        currentLocationController.findCurrentLocation();
      },
      icon: const Icon(
        Icons.location_on,
        size: 30,
      ),
    );
  }
}
