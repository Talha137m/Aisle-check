import 'dart:developer';

import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/core/common/widgets/devider_widget.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/common/widgets/show_meesage_widget.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/auth/admin_auth/controllers/admin_signup_controller.dart';
import 'package:aislecheck/features/auth/admin_auth/controllers/password_field_visibility.dart';
import 'package:aislecheck/features/auth/admin_auth/views/admin_sign_in_page.dart';
import 'package:aislecheck/features/auth/views/sign_in_page.dart';
import 'package:aislecheck/features/auth/views/widgets/contine_with.dart';
import 'package:aislecheck/features/auth/views/widgets/onclick_signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminSignUpPage extends StatelessWidget {
  const AdminSignUpPage({super.key});
  static const name = '/adminSignUpPage';

  @override
  Widget build(BuildContext context) {
    AdminSignupController adminAuthController =
        context.watch<AdminSignupController>();
    PasswordFieldVisibility passwordFieldVisibility =
        context.watch<PasswordFieldVisibility>();
    log(passwordFieldVisibility.obscureText.toString());
    log('initial:${adminAuthController.initialState},loading:${adminAuthController.loadingState},loaded:${adminAuthController.dataSate},errorState:${adminAuthController.errorState}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Builder(
          builder: (context) {
            if (adminAuthController.initialState) {
              return AdminFormWidget(
                adminAuthController: adminAuthController,
                passwordFieldVisibility: passwordFieldVisibility,
              );
            } else if (adminAuthController.loadingState) {
              return const LoadingWidget();
            } else if (adminAuthController.dataSate) {
              context.showPopUpMsg('succesfully signup go to the sigin page');
              return AdminFormWidget(
                passwordFieldVisibility: passwordFieldVisibility,
                adminAuthController: adminAuthController,
              );
            } else {
              context.showMessageDialog(
                  'message', adminAuthController.errorMessage);
              return AdminFormWidget(
                adminAuthController: adminAuthController,
                passwordFieldVisibility: passwordFieldVisibility,
              );
            }
          },
        ),
      ),
    );
  }
}

//...this the form widget for signup page for admin
class AdminFormWidget extends StatelessWidget {
  final AdminSignupController adminAuthController;
  final PasswordFieldVisibility passwordFieldVisibility;
  const AdminFormWidget(
      {super.key,
      required this.adminAuthController,
      required this.passwordFieldVisibility});
  static const _twentyFlex = 20;
  static const _fiveFlex = 5;
  static const _tenFlex = 10;
  static const _twentyFiveFlex = 25;

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Form(
      key: adminAuthController.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: _twentyFlex,
          ),
          Text(
            'Sign up',
            style:
                GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.w700),
          ),
          const Spacer(
            flex: _fiveFlex,
          ),
          Text(
            'Hello there! Let’s create your account',
            style:
                GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const Spacer(
            flex: _fiveFlex,
          ),
          DataCollectionTextFormField(
            hintAndLabelText: 'Name',
            keyboardType: TextInputType.name,
            validator: adminAuthController.isEmptyForm,
            textEditingController: adminAuthController.nameController,
          ),
          const Spacer(
            flex: _fiveFlex,
          ),
          DataCollectionTextFormField(
            hintAndLabelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: adminAuthController.emailValidation,
            textEditingController: adminAuthController.emailController,
          ),
          const Spacer(
            flex: _fiveFlex,
          ),
          DataCollectionTextFormField(
            hintAndLabelText: 'Phone No',
            keyboardType: TextInputType.number,
            validator: adminAuthController.phoneNumberValidation,
            textEditingController: adminAuthController.phoneNumberController,
          ),
          const Spacer(
            flex: _fiveFlex,
          ),
          DataCollectionTextFormField(
            suffix: _obscureIcon(),
            obscureText: passwordFieldVisibility.obscureText,
            hintAndLabelText: 'Password',
            keyboardType: TextInputType.name,
            validator: adminAuthController.isEmptyForm,
            textEditingController: adminAuthController.passwordController,
          ),
          const Spacer(
            flex: _fiveFlex,
          ),
          DataCollectionTextFormField(
            obscureText: passwordFieldVisibility.obscureText,
            hintAndLabelText: 'Confirm Password',
            keyboardType: TextInputType.name,
            validator: adminAuthController.confrimPasswordValidation,
            textEditingController:
                adminAuthController.confirmPasswordController,
            suffix: _obscureIcon(),
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
          AppCompactBtn(
            btnName: 'Sign Up',
            btnBackgroundColor: AppColors.greenColor,
            onTap: () {
              // if (adminAuthController.formKey.currentState!.validate()) {
              //   adminAuthController.createUser();
              // } else {
              //   context.showPopUpMsg('fields should not empty');
              // }
            },
          ),
          const Spacer(
            flex: _tenFlex,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AdmminSignInPage.name);
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
    );
  }

  Widget _obscureIcon() {
    return IconButton(
      onPressed: _obscureText,
      icon: Icon(passwordFieldVisibility.obscureText
          ? Icons.visibility_off
          : Icons.visibility),
    );
  }

  void _obscureText() {
    passwordFieldVisibility
        .obscureTextState(!passwordFieldVisibility.obscureText);
  }
}
