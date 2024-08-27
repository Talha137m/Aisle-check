import 'package:aislecheck/core/common/widgets/customer_app_bar.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/profile_details/views/widgets/profile_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/strings/app_colors.dart';

class ProfileDeatilsScreen extends StatelessWidget {
  const ProfileDeatilsScreen({super.key});
  //....PAGE NAME
  static const pageName = '/profile_details';
  //....CONSTANT VALUES
  static const _profile = 'Profile';
  static const _firstFieldHint = 'username';
  static const _secondFieldHint = 'username@gmail.com';
  static const _thirdFieldHint = '+91 234 567 8';
  static const _fourthFieldHint = 'pakistanZindabad';
  static const _btnText = 'Save Changes';
  static const _contentPadding = 0.05;
  static const _oneSecondPercent = 0.02;
  static const _oneThirdPercent = 0.03;
  static const _onePercent = 0.1;
  static const _pointZeroOnePercent = 0.01;
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const CustomerAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * _contentPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * _oneSecondPercent,
              ),
              Text(
                _profile,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: height * _oneThirdPercent,
                ),
              ),
              SizedBox(
                height: height * _oneThirdPercent,
              ),
              const UserPictureWidget(
                image: CustmoerImages.shop,
              ),
              SizedBox(
                height: height * _oneThirdPercent,
              ),
              ProfilePageTextFields(
                controller: TextEditingController(),
                hintText: _firstFieldHint,
                validator: (value) => null,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),
              ProfilePageTextFields(
                controller: TextEditingController(),
                hintText: _secondFieldHint,
                validator: (value) => null,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),
              ProfilePageTextFields(
                controller: TextEditingController(),
                hintText: _thirdFieldHint,
                validator: (value) => null,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: height * _pointZeroOnePercent,
              ),
              ProfilePageTextFields(
                controller: TextEditingController(),
                isObscured: true,
                hintText: _fourthFieldHint,
                validator: (value) => null,
                keyboardType: TextInputType.text,
                suffixIcon: const Icon(
                  Icons.visibility_outlined,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(
                height: height * _onePercent,
              ),
              AppCompactBtn(
                onTap: () {
                  context.showPopUpMsg('Changes Saved');
                },
                borderRadius: _btnRadius,
                btnName: _btnText,
                isTextBold: true,
                btnHeight: _btnHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
