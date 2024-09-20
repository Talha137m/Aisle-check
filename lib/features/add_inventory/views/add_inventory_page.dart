import 'dart:io';

import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/core/common/widgets/admin_lis_tile.dart';
import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/error_msg_widget.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/common/widgets/show_meesage_widget.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/common/widgets/upload_image_tile.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/add_inventory/controllers/upload_inventry_controller.dart';
import 'package:aislecheck/features/add_inventory/controllers/upload_inventry_image_controller.dart';
import 'package:aislecheck/features/admin_home/controllers/fetch_inventry_controller.dart';
import 'package:aislecheck/features/admin_home/views/admin_home_page.dart';
import 'package:aislecheck/features/edit_inventory/views/widgets/edit_inventory_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/strings/app_colors.dart';

class AddInventoryPage extends StatelessWidget {
  const AddInventoryPage({super.key});
  //...PAGE NAME
  static const pageName = '/add_inventory_page';

  @override
  Widget build(BuildContext context) {
    UploadInventryController inventryController =
        context.watch<UploadInventryController>();

    return Scaffold(
        appBar: GlobalAppBar(
          titleText: 'Ads',
        ),
        body: switch (inventryController.state) {
          UploadInventryInitialState() => UploadInventryWidget(
              inventryController: inventryController,
            ),
          UploadInventryLoadingState() => const LoadingWidget(),
          UploadInventryLoadedState() => UserMessage(
              message: 'Successfully uploaded tab to resturn inventry page',
              refresh: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AdminHomePage.pageName, (route) => false);
              }),
          UploadInventryErrorState() => ErrorMessageWidget(
              title: 'Something went wrong',
              message:
                  (inventryController.state as UploadInventryErrorState).msg,
            ),
        });
  }
}

class UploadInventryWidget extends StatelessWidget {
  final UploadInventryController inventryController;
  const UploadInventryWidget({super.key, required this.inventryController});
  //.....CONTANT VALUES
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroFivePercent = 0.05;
  static const _pointTwoPercent = 0.2;
  static const _pointThreePercent = 0.3;
  static const _fontSize = 13.0;
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  static const _btnText = 'Add';

  @override
  Widget build(BuildContext context) {
    UploadInventryImageController imageController =
        context.watch<UploadInventryImageController>();
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * _pointZeroFivePercent,
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),

            //...................PRODUCT NAME TILE
            AdminAppCompactTextField(
              controller: inventryController.productNameController,
              hintText: 'Product name',
              validator: (value) {
                return null;
              },
            ),
            SizedBox(
              height: height * _pointZeroOnePercent,
            ),

            //...................PRODUCT Category TILE
            AdminAppCompactTextField(
                validator: (value) {
                  return null;
                },
                controller: inventryController.productCategoryController,
                hintText: 'Category'),
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),

            //.......PRODUCT QAUNTITY TILE
            CustomFilledListTile(
              leading: Text('Quantity',
                  style: GoogleFonts.roboto(
                    fontSize: _fontSize,
                    color: AppColors.blackColor,
                  )),
              trailing: SizedBox(
                width: width * _pointThreePercent,
                child: ListTileTrailingWidget(
                  onAddBtnTap: () {
                    inventryController.incrementQuantity();
                  },
                  onSubtractBtnTap: () {
                    inventryController.decrementQuantity();
                  },
                  quantity: inventryController.quantity.toString(),
                ),
              ),
            ),
            SizedBox(
              height: height * _pointZeroOnePercent,
            ),

            //.......PRODUCT PRICE PER ITEM TILE
            CustomFilledListTile(
              leading: Text('Price per item',
                  style: GoogleFonts.roboto(
                    fontSize: _fontSize,
                    color: AppColors.blackColor,
                  )),
              trailing: SizedBox(
                width: width * _pointThreePercent,
                child: ListTileTrailingWidget(
                  quantity: '\$${inventryController.price.toString()}',
                  onAddBtnTap: () => inventryController.incrementPrice(),
                  onSubtractBtnTap: () => inventryController.decrementPrice(),
                ),
              ),
            ),
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),

            //.....UPLAOD IMAGE TILE
            switch (imageController.state) {
              InventryImagePickerInitialState() =>
                _pickImage(imageController: imageController),
              InventryImagePickerLoadingState() => const LoadingWidget(),
              InventryImagePickerEmptyState() =>
                _pickImage(imageController: imageController),
              InventryImagePickerLoadedState() => _pickImage(
                  imageController: imageController,
                  file:
                      (imageController.state as InventryImagePickerLoadedState)
                          .image),
              InventryImagePickerErrorState() => UserMessage(
                  message:
                      (imageController.state as InventryImagePickerErrorState)
                          .msg,
                  refresh: () {
                    imageController.pickImageFromGallery();
                  }),
            },
            SizedBox(
              height: height * _pointTwoPercent,
            ),
            AppCompactBtn(
              onTap: () {
                if (imageController.state is InventryImagePickerLoadedState) {
                  inventryController.uploadInventry(
                      (imageController.state as InventryImagePickerLoadedState)
                          .image);
                } else {
                  context.showPopUpMsg('Image is required');
                }
                //showSnackBar(context, 'Item added');
              },
              borderRadius: _btnRadius,
              btnHeight: _btnHeight,
              btnName: _btnText,
              isTextBold: true,
            ),
            SizedBox(
              height: height * _pointZeroFivePercent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _pickImage(
      {required UploadInventryImageController imageController, File? file}) {
    return UploadImageTile(
      ontab: () {
        imageController.pickImageFromGallery();
      },
      file: file,
    );
  }
}
