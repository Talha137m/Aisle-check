import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/devider_widget.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';

import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/admin_home/views/admin_home_page.dart';
import 'package:aislecheck/features/auth/admin_auth/controllers/admin_signin_controller.dart';
import 'package:aislecheck/features/auth/admin_auth/controllers/password_field_visibility.dart';
import 'package:aislecheck/features/auth/admin_auth/views/admin_sign_up_page.dart';
import 'package:aislecheck/features/auth/views/widgets/contine_with.dart';
import 'package:aislecheck/features/auth/views/widgets/onclick_signup_widget.dart';
import 'package:aislecheck/features/register_shop/views/register_shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdmminSignInPage extends StatelessWidget {
  const AdmminSignInPage({super.key});
  static const name = '/admminSignInPage';

  @override
  Widget build(BuildContext context) {
    PasswordFieldVisibility passwordFieldVisibility =
        context.watch<PasswordFieldVisibility>();
    AdminSigninController adminSigninController =
        context.watch<AdminSigninController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (context) {
          switch (adminSigninController.state) {
            case AdminSigninInitialState():
              return AdminSigninForm(
                  passwordFieldVisibility: passwordFieldVisibility,
                  adminSigninController: adminSigninController);
            case AdminSigninLoadedState():
              _navigate(
                () {
                  Navigator.pushNamed(context, RegisterShopPage.name);
                  adminSigninController.reinitializeState();
                },
              );
              return AdminSigninForm(
                  passwordFieldVisibility: passwordFieldVisibility,
                  adminSigninController: adminSigninController);
            case AdminSigninLoadingState():
              return const LoadingWidget();
            case AdminSigninErrorState():
              context.showMessageDialog(
                  'Action Failed!',
                  (adminSigninController.state as AdminSigninErrorState)
                      .errorMessage);
              return AdminSigninForm(
                  passwordFieldVisibility: passwordFieldVisibility,
                  adminSigninController: adminSigninController);
          }
        },
      ),
    );
  }

  void _navigate(VoidCallback navigate) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        navigate();
      },
    );
  }
}

class AdminSigninForm extends StatelessWidget {
  final PasswordFieldVisibility passwordFieldVisibility;
  final AdminSigninController adminSigninController;

  const AdminSigninForm(
      {super.key,
      required this.passwordFieldVisibility,
      required this.adminSigninController});
  static const _twentyFlex = 20;
  static const _fiveFlex = 5;
  static const _tenFlex = 10;
  static const _twentyFiveFlex = 25;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
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
            style:
                GoogleFonts.roboto(fontSize: 26, fontWeight: FontWeight.w700),
          ),
          const Spacer(
            flex: _fiveFlex,
          ),
          Text(
            'Welcome back! Please enter your details.',
            style:
                GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const Spacer(
            flex: _fiveFlex,
          ),
          DataCollectionTextFormField(
            hintAndLabelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: adminSigninController.emailValidation,
            textEditingController: adminSigninController.emailController,
          ),
          const Spacer(
            flex: _fiveFlex,
          ),
          DataCollectionTextFormField(
            hintAndLabelText: 'Password',
            keyboardType: TextInputType.text,
            obscureText: passwordFieldVisibility.obscureText,
            suffix: _obscureIcon(),
            validator: adminSigninController.isEmptyForm,
            textEditingController: adminSigninController.passwordController,
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
            child: OnclickSignupWidget(
              width: width,
              height: height,
              appleSignIn: () {},
              emailSignIn: () {},
              facebookSignin: () {},
              googleSignIn: () {
                adminSigninController.adminGoogleSignIn();
              },
            ),
          ),
          const Spacer(
            flex: _twentyFlex,
          ),
          AppCompactBtn(
            btnName: 'Sign In',
            btnBackgroundColor: AppColors.greenColor,
            onTap: () {
              adminSigninController.signIn();
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
