import 'package:aislecheck/core/common/widgets/devider_widget.dart';
import 'package:aislecheck/core/common/widgets/user_side_btn.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/auth/views/widgets/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseRolePage extends StatelessWidget {
  const ChooseRolePage({super.key});
  static const String name = '/chooseRole';
  static const int _fiveFlexRate = 5;
  static const int _twentyFlexRate = 20;
  static const int _tenFlexRate = 10;
  static const _twentyFiveFlexRate = 25;
  static const _thirtyFiveFlexRate = 35;
  static const _oneFlexRate = 1;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Align(
            alignment: const Alignment(0, 0),
            child: Image.asset(
              AppImages.appLogo,
              width: width * 0.6,
              height: height * 0.4,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: width * 0.9,
            child: Text(
              'App Name',
              style:
                  GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          const Spacer(
            flex: _tenFlexRate,
          ),
          SizedBox(
            width: width * 0.9,
            child: Text(
              'Discover and shop from the best local stores with Foe Shopping Shop - your one-stop solution for all your shopping needs',
              style: GoogleFonts.roboto(
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const Spacer(
            flex: _twentyFlexRate,
          ),
          SizedBox(
            width: width * 0.9,
            child: Text(
              'Continue as :',
              style:
                  GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(
            flex: _fiveFlexRate,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckboxListTile.adaptive(
              tileColor: AppColors.checkBoxlistTileColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.grey, width: 1.2),
              ),
              title: Text(
                'Shop owner',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
              ),
              value: true, // You can manage this with state
              onChanged: (newValue) {},
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: AppColors.blackColor,
            ),
          ),
          const Spacer(
            flex: _fiveFlexRate,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckboxListTile.adaptive(
              tileColor: AppColors.checkBoxlistTileColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.grey, width: 1.2),
              ),
              title: Text(
                'Customer',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
              ),
              value: false, // You can manage this with state
              onChanged: (newValue) {},
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: AppColors.blackColor,
            ),
          ),
          const Spacer(
            flex: _twentyFiveFlexRate,
          ),
          UserSideBtn(
            btnName: 'Continue',
            btnBackgroundColor: AppColors.grayColor,
            onTap: () {
              Navigator.pushNamed(context, SignUpPage.name);
            },
          ),
          const Spacer(
            flex: _thirtyFiveFlexRate,
          ),
          const DividerWidget(),
          const Spacer(
            flex: _oneFlexRate,
          )
        ],
      ),
    );
  }
}
