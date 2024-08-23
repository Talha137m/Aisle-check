import 'package:aislecheck/core/common/widgets/devider_widget.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/common/widgets/user_side_btn.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/auth/views/sign_in_page.dart';
import 'package:aislecheck/features/auth/views/widgets/contine_with.dart';
import 'package:aislecheck/features/auth/views/widgets/onclick_signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static const name = '/signUpPage';
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
                'Sign up',
                style: GoogleFonts.roboto(
                    fontSize: 26, fontWeight: FontWeight.w700),
              ),
              const Spacer(
                flex: _fiveFlex,
              ),
              Text(
                'Hello there! Let’s create your account',
                style: GoogleFonts.roboto(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(
                flex: _fiveFlex,
              ),
              DataCollectionTextFormField(
                hintAndLabelText: 'Name',
                keyboardType: TextInputType.name,
                validator: (value) {},
                textEditingController: TextEditingController(),
              ),
              const Spacer(
                flex: _fiveFlex,
              ),
              DataCollectionTextFormField(
                hintAndLabelText: 'Email',
                keyboardType: TextInputType.name,
                validator: (value) {},
                textEditingController: TextEditingController(),
              ),
              const Spacer(
                flex: _fiveFlex,
              ),
              DataCollectionTextFormField(
                hintAndLabelText: 'Phone No',
                keyboardType: TextInputType.name,
                validator: (value) {},
                textEditingController: TextEditingController(),
              ),
              const Spacer(
                flex: _fiveFlex,
              ),
              DataCollectionTextFormField(
                hintAndLabelText: 'Password',
                keyboardType: TextInputType.name,
                validator: (value) {},
                textEditingController: TextEditingController(),
              ),
              const Spacer(
                flex: _fiveFlex,
              ),
              DataCollectionTextFormField(
                hintAndLabelText: 'Confirm Password',
                keyboardType: TextInputType.name,
                validator: (value) {},
                textEditingController: TextEditingController(),
              ),
              const Spacer(
                flex: _tenFlex,
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
              UserSideBtn(
                btnName: 'Sign Up',
                btnBackgroundColor: AppColors.greenColor,
                onTap: () {},
              ),
              const Spacer(
                flex: _tenFlex,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignInPage.name);
                },
                child: Center(
                  child: Text(
                    'Already a member? Log in',
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
