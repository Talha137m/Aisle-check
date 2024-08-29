import 'package:aislecheck/core/common/widgets/admin_lis_tile.dart';
import 'package:aislecheck/core/constants/enumration/payment_method.dart';
import 'package:aislecheck/features/ad_payment/views/ad_payment_page.dart';
import 'package:aislecheck/features/admin_profile/views/admin_profile_page.dart';
import 'package:aislecheck/features/inetgrate_inventory/views/integrate_inventory_page.dart';
import 'package:aislecheck/features/membership_plan/views/membership_plan_page.dart';
import 'package:aislecheck/features/payment_method/views/payment_method_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/strings/app_colors.dart';

class ManagementTiles extends StatelessWidget {
  const ManagementTiles({super.key});
  //.....CONSTANT VALUES
  static const _profile = 'Profile';
  static const _membership = 'Membership Plans';
  static const _payment = 'Payment Method';
  static const _schedule = 'Schedule Inventory ';
  static const _offline = 'Offline Inventory';
  static const _invnetory = 'Inventory Programs Integration';
  static const _settings = 'Settings';
  static const _customerSupport = 'Customer Support';
  static const _pointZeroTwoPercent = 0.02;
  static const _fontSize = 13.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Column(
      children: [
        //...........PROFILE TILE
        CustomFilledListTile(
          onTab: () {
            Navigator.of(context).pushNamed(AdminProfilePage.pageName);
          },
          leading: const Icon(
            Icons.person_2_outlined,
            color: AppColors.blackColor,
          ),
          title: Text(
            _profile,
            style: GoogleFonts.roboto(
              fontSize: _fontSize,
              color: AppColors.blackColor,
            ),
          ),
        ),
        SizedBox(
          height: height * _pointZeroTwoPercent,
        ),
        //MEMBER SHIP TILE
        CustomFilledListTile(
          onTab: () {
            Navigator.of(context).pushNamed(MemberShipPlanPage.pageName);
          },
          leading: const Icon(
            Icons.monetization_on_outlined,
            color: AppColors.blackColor,
          ),
          title: Text(
            _membership,
            style: GoogleFonts.roboto(
              fontSize: _fontSize,
              color: AppColors.blackColor,
            ),
          ),
        ),

        SizedBox(
          height: height * _pointZeroTwoPercent,
        ),

        //PAYMENT TILE
        CustomFilledListTile(
          onTab: () {
            Navigator.pushNamed(context, PaymentMethodPage.pageName);
          },
          leading: const Icon(
            Icons.payment_outlined,
            color: AppColors.blackColor,
          ),
          title: Text(
            _payment,
            style: GoogleFonts.roboto(
              fontSize: _fontSize,
              color: AppColors.blackColor,
            ),
          ),
        ),

        SizedBox(
          height: height * _pointZeroTwoPercent,
        ),

        //.....SCHEDULE INVENTORY TILE
        CustomFilledListTile(
          leading: const Icon(
            Icons.calendar_today_outlined,
            color: AppColors.blackColor,
          ),
          title: Text(
            _schedule,
            style: GoogleFonts.roboto(
              fontSize: _fontSize,
              color: AppColors.blackColor,
            ),
          ),
        ),

        SizedBox(
          height: height * _pointZeroTwoPercent,
        ),

        //.......OFFLINE  INVENTORY TILE
        CustomFilledListTile(
          leading: const Icon(
            Icons.inventory_2_outlined,
            color: AppColors.blackColor,
          ),
          title: Text(
            _offline,
            style: GoogleFonts.roboto(
              fontSize: _fontSize,
              color: AppColors.blackColor,
            ),
          ),
        ),

        SizedBox(
          height: height * _pointZeroTwoPercent,
        ),

        //inventry programme integration
        CustomFilledListTile(
          onTab: () {
            Navigator.pushNamed(context, IntegrateInventoryPage.pageName);
          },
          leading: const Icon(
            Icons.link,
            color: AppColors.blackColor,
          ),
          title: Text(
            _invnetory,
            style: GoogleFonts.roboto(
              fontSize: _fontSize,
              color: AppColors.blackColor,
            ),
          ),
        ),

        SizedBox(
          height: height * _pointZeroTwoPercent,
        ),

        //......SETTINGS  TILE
        CustomFilledListTile(
          leading: const Icon(
            Icons.settings_outlined,
            color: AppColors.blackColor,
          ),
          title: Text(
            _settings,
            style: GoogleFonts.roboto(
              fontSize: _fontSize,
              color: AppColors.blackColor,
            ),
          ),
        ),

        SizedBox(
          height: height * _pointZeroTwoPercent,
        ),

        //....CUSOTMER SUPPORT  TILE
        CustomFilledListTile(
          leading: const Icon(
            Icons.mode_comment_outlined,
            color: AppColors.blackColor,
          ),
          title: Text(
            _customerSupport,
            style: GoogleFonts.roboto(
              fontSize: _fontSize,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
