import 'dart:developer';

import 'package:aislecheck/core/common/widgets/devider_widget.dart';
import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/common/widgets/show_meesage_widget.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/admin_home/views/admin_home_page.dart';
import 'package:aislecheck/features/auth/admin_auth/views/admin_sign_up_page.dart';
import 'package:aislecheck/features/auth/views/sign_up_page.dart';
import 'package:aislecheck/features/choose_role/controllers/check_choose_role.dart';
import 'package:aislecheck/features/choose_role/controllers/check_is_admin_login.dart';
import 'package:aislecheck/features/choose_role/controllers/check_is_shop_register.dart';
import 'package:aislecheck/features/choose_role/controllers/check_is_user_login.dart';
import 'package:aislecheck/features/choose_role/controllers/choose_role_controller.dart';
import 'package:aislecheck/features/register_shop/views/register_shop_page.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseRolePage extends StatelessWidget {
  const ChooseRolePage({super.key});
  static const String name = '/chooseRole';
  @override
  Widget build(BuildContext context) {
    ChooseRoleController role = context.watch<ChooseRoleController>();
    CheckIsAdminLoginController adminLogin =
        context.watch<CheckIsAdminLoginController>();
    CheckIsUserLoginController isUserLoginController =
        context.watch<CheckIsUserLoginController>();
    CheckIsShopRegisterController shopRegisterController =
        context.watch<CheckIsShopRegisterController>();
    CheckChooseRole chooseRole = context.watch<CheckChooseRole>();
    log('role:${role.adminRole},adminlogin:${adminLogin.state},userlogin:${isUserLoginController.state}');
    log('roleeeeeeeeeeeeeee${chooseRole.state}');
    return Scaffold(
        body: switch (chooseRole.state) {
      ChooseRoleInitialState() => ChooseRoleWidget(role: role),
      ChooseRoleLoadingState() => LoadingWidget(
          event: () {
            chooseRole.checkRole();
            //chooseRole.checkUserRole();
          },
        ),
      AdminChooseRoleState() => switch (adminLogin.state) {
          AdminLogninLoadingState() => LoadingWidget(event: () {
              adminLogin.checkIsAdminLogin();
              shopRegisterController.isShopRegister();
            }),
          AdminLoginInitialState() => ChooseRoleWidget(role: role),
          AdminLoginTrueSate() => switch (shopRegisterController.state) {
              ShopRegisterLoadingState() => const LoadingWidget(),
              ShopRegisterTrueState() => AdminHomePage(),
              ShopRegisterFalseState() => const RegisterShopPage(),
            },
          AdminLoginFalseState() => const AdminSignUpPage(),
        },
      UserChooseRoleState() => switch (isUserLoginController.state) {
          //UserLogninLoadingState() => ChooseRoleWidget(role: role),
          UserLogninLoadingState() => LoadingWidget(event: () {
              isUserLoginController.checkIsUserLogin();
            }),
          UserLoginInitialState() => ChooseRoleWidget(role: role),
          UserLoginTrueSate() => UserHomePage(),
          UserLoginFalseState() => const SignUpPage(),
        },
      CheckChooseRoleErrorState() =>
        UserMessage(message: 'Something went wrong', refresh: () {}),
    }
        // return switch (role.adminRole) {
        //   true => switch (adminLogin.state) {
        //       AdminLogninLoadingState() => LoadingWidget(event: () {
        //           adminLogin.checkIsAdminLogin();
        //           shopRegisterController.isShopRegister();
        //         }),
        //       AdminLoginTrueSate() => switch (shopRegisterController.state) {
        //           ShopRegisterLoadingState() => const LoadingWidget(),
        //           ShopRegisterTrueState() => AdminHomePage(),
        //           ShopRegisterFalseState() => const RegisterShopPage(),
        //         },
        //       AdminLoginFalseState() => ChooseRoleWidget(role: role),
        //       AdminLoginInitialState() => switch (chooseRole.state) {
        //           ChooseRoleInitialState() => ChooseRoleWidget(role: role),
        //           ChooseRoleLoadingState() => const LoadingWidget(),
        //           AdminChooseRoleState() => AdminHomePage(),
        //           UserChooseRoleState() => UserHomePage(),
        //           CheckChooseRoleErrorState() =>
        //             UserMessage(message: 'message', refresh: () {}),
        //         },
        //     },
        //   false => switch (isUserLoginController.state) {
        //       UserLogninLoadingState() => const LoadingWidget(),
        //       UserLoginTrueSate() => UserHomePage(),
        //       UserLoginFalseState() => const SignUpPage(),
        //       UserLoginInitialState() => ChooseRoleWidget(role: role),
        //     },
        // };

        );
  }
}

class MyWidget extends StatelessWidget {
  final VoidCallback refresh;
  const MyWidget({super.key, required this.refresh});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPersistentFrameCallback(
      (_) {
        refresh();
      },
    );
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ChooseRoleWidget extends StatelessWidget {
  final ChooseRoleController role;
  const ChooseRoleWidget({super.key, required this.role});
  static const int _fiveFlexRate = 5;
  static const int _twentyFlexRate = 20;
  static const int _tenFlexRate = 10;
  static const _twentyFiveFlexRate = 25;
  static const _thirtyFiveFlexRate = 35;
  static const _oneFlexRate = 1;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Column(
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
          child: CheckboxListTile(
            tileColor: AppColors.checkBoxlistTileColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.grey, width: 1.2),
            ),
            title: Text(
              'Shop owner',
              style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
            ),
            value: role.adminRole, // You can manage this with state
            onChanged: (newValue) {
              context
                  .read<ChooseRoleController>()
                  .chooseOption(shopOwnerRole: newValue, customerRole: false);
            },

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
            value: role.userRole, // You can manage this with state
            onChanged: (newValue) {
              context
                  .read<ChooseRoleController>()
                  .chooseOption(customerRole: newValue, shopOwnerRole: false);
            },
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: AppColors.blackColor,
          ),
        ),
        const Spacer(
          flex: _twentyFiveFlexRate,
        ),
        AppCompactBtn(
          btnName: 'Continue',
          btnBackgroundColor: switch (role.adminRole || role.userRole) {
            true => AppColors.greenColor,
            false => AppColors.grayColor,
          },
          onTap: () {
            if (role.userRole || role.adminRole) {
              switch (role.userRole) {
                case true:
                  context.read<CheckIsUserLoginController>().checkIsUserLogin();
                  context.read<CheckChooseRole>().inserRoleOfUser(true);
                  context.read<CheckChooseRole>().insertRoleOfAdmin(false);
                  context.read<CheckChooseRole>().checkRole();
                //Navigator.pushNamed(context, SignUpPage.name);
                case false:
                  // context
                  //     .read<CheckIsAdminLoginController>()
                  //     .checkIsAdminLogin();
                  // context
                  //     .read<CheckIsShopRegisterController>()
                  //     .isShopRegister();
                  // Navigator.pushNamed(context, AdminSignUpPage.name);
                  context.read<CheckChooseRole>().inserRoleOfUser(false);
                  context.read<CheckChooseRole>().insertRoleOfAdmin(true);
                  context.read<CheckChooseRole>().checkRole();
              }
            } else {
              context.showPopUpMsg('please elect the role first');
            }
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
    );
  }
}
