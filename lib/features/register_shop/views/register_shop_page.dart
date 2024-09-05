import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/common/widgets/upload_image_tile.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class RegisterShopPage extends StatelessWidget {
  const RegisterShopPage({super.key});
  static const String name = '/registerShopPage';
  //.....CONTANT VALUES
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  static const _btnText = 'Upload';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(titleText: 'Ads'),
      body: Column(
        children: [
          DataCollectionTextFormField(
            hintAndLabelText: 'Shop Name',
            keyboardType: TextInputType.text,
            validator: (value) {
              return null;
            },
            textEditingController: TextEditingController(),
          ),
          DataCollectionTextFormField(
            hintAndLabelText: 'Shop location',
            keyboardType: TextInputType.text,
            validator: (value) {
              return null;
            },
            textEditingController: TextEditingController(),
            isReadOnly: true,
            suffix: const Icon(Icons.location_on),
            onTab: () {
              Geolocator.getCurrentPosition();
            },
          ),
          UploadImageTile(
            ontab: () {},
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
        ],
      ),
    );
  }
}
