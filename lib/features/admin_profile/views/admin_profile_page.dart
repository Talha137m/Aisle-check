import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/features/admin_profile/views/widgets/admin_profile_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/common/widgets/text_field_widget.dart';
import '../../../core/constants/images_path.dart';
import '../../../core/constants/strings/app_colors.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});
  //....PAGE NAME
  static const pageName = '/admin_profile_details';
  //....CONSTANT VALUES
  static const _title = 'Ads';
  static const _profile = 'Profile';
  static const _firstFieldHint = 'username';
  static const _secondFieldHint = 'username@gmail.com';
  static const _thirdFieldHint = '+91 234 567 8';
  static const _fourthFieldHint = 'pakistanZindabad';
  static const _contentPadding = 0.05;
  static const _oneSecondPercent = 0.02;
  static const _oneThirdPercent = 0.03;
  static const _onePercent = 0.1;
  static const _pointZeroOnePercent = 0.01;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(titleText: _title),
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
              const AdminPictureWidget(
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
            ],
          ),
        ),
      ),
    );
  }
}
