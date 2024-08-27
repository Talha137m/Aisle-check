import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/devider_widget.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';

import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/admin_home/views/admin_home_page.dart';
import 'package:aislecheck/features/auth/admin_auth/views/admin_sign_up_page.dart';
import 'package:aislecheck/features/auth/views/widgets/contine_with.dart';
import 'package:aislecheck/features/auth/views/widgets/onclick_signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmminSignInPage extends StatelessWidget {
  const AdmminSignInPage({super.key});
  static const name = '/admminSignInPage';
  static const _twentyFlex = 20;
  static const _fiveFlex = 5;
  static const _tenFlex = 10;
  static const _twentyFiveFlex = 25;

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: _twentyFlex,
              ),
              Text(
                'Sign In',
                style: GoogleFonts.roboto(
                    fontSize: 26, fontWeight: FontWeight.w700),
              ),
              const Spacer(
                flex: _fiveFlex,
              ),
              Text(
                'Welcome back! Please enter your details.',
                style: GoogleFonts.roboto(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(
                flex: _fiveFlex,
              ),
              DataCollectionTextFormField(
                hintAndLabelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return null;
                },
                textEditingController: TextEditingController(),
              ),
              const Spacer(
                flex: _fiveFlex,
              ),
              DataCollectionTextFormField(
                hintAndLabelText: 'Phone Number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  return null;
                },
                textEditingController: TextEditingController(),
              ),
              const Spacer(
                flex: _fiveFlex,
              ),
              DataCollectionTextFormField(
                hintAndLabelText: 'Password',
                keyboardType: TextInputType.text,
                validator: (value) {
                  return null;
                },
                textEditingController: TextEditingController(),
              ),
              const Spacer(
                flex: _twentyFiveFlex,
              ),
              Expanded(
                flex: _twentyFiveFlex,
                child: ContineWith(
                  width: width,
                ),
              ),
              const Spacer(
                flex: _tenFlex,
              ),
              Expanded(
                  flex: 25,
                  child: OnclickSignupWidget(width: width, height: height)),
              const Spacer(
                flex: _twentyFlex,
              ),
              AppCompactBtn(
                btnName: 'Sign In',
                btnBackgroundColor: AppColors.greenColor,
                onTap: () {
                  Navigator.pushNamed(context, AdminHomePage.pageName);
                },
              ),
              const Spacer(
                flex: _tenFlex,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AdminSignUpPage.name);
                },
                child: Center(
                  child: Text(
                    'First time here?? Sign up',
                    style: GoogleFonts.roboto(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Center(
                child: DividerWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
