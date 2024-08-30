import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/features/browsing_history/views/browsing_history_page.dart';
import 'package:aislecheck/features/customer_support/views/customer_support_page.dart';
import 'package:aislecheck/features/profile_details/views/profile_details_page.dart';
import 'package:aislecheck/features/shops_map/views/shops_location.dart';
import 'package:aislecheck/features/user_home/controllers/user_bottom_controller.dart';
import 'package:aislecheck/features/wallet/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'widgets/user_detail_widgets.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({
    super.key,
  });

  //...PAGE NAME
  static const pageName = '/profile_page';
  //....CONSTANT VALUES

  @override
  Widget build(BuildContext context) {
    return const ProfileWidget(
        username: 'Talha',
        email: 'dummmy@gmail.com',
        image: CustmoerImages.emailIcon);
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {super.key,
      required this.username,
      required this.email,
      required this.image});
  final String username, email, image;
  static const _accountsHeading = 'Account & Settings';
  static const _profile = 'Profile';
  static const _browseHistory = 'Browsing History';
  static const _shoppingList = 'Shopping list';
  static const _mapText = 'Map';
  static const _notifyText = 'Notifications';
  static const _customerSupport = 'Customer Support';
  static const _accountsHeadingFont = 0.025;
  static const _contentPadding = 0.05;
  static const _spacing = 0.02;
  static const _userInfoBoxHeight = 0.2;
  static const _optionContainerHeight = 0.15;

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * _contentPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * _spacing,
            ),
            Text(
              _accountsHeading,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: height * _accountsHeadingFont,
              ),
            ),
            SizedBox(
              height: height * _userInfoBoxHeight,
              child: UserInfo(
                email: email,
                image: image,
                name: username,
              ),
            ),
            SizedBox(
              height: height * _optionContainerHeight,
              child: const FavAndPromoRow(),
            ),
            SizedBox(
              height: height * _spacing,
            ),
            SettingsTile(
              navigateTab: () {
                Navigator.of(context).pushNamed(ProfileDeatilsScreen.pageName);
              },
              icon: Icons.person_2_outlined,
              title: _profile,
            ),
            SettingsTile(
              navigateTab: () {
                Navigator.of(context).pushNamed(BrowsingHistoryPage.name);
              },
              icon: Icons.timer_outlined,
              title: _browseHistory,
            ),
            SettingsTile(
              navigateTab: () {
                context.read<UserBottomController>().changeState(1);
              },
              icon: Icons.list,
              title: _shoppingList,
            ),
            SettingsTile(
              navigateTab: () {
                Navigator.of(context).pushNamed(ShopsLocation.name);
              },
              icon: Icons.location_on,
              title: _mapText,
            ),
            SettingsTile(
              navigateTab: () {
                context.read<UserBottomController>().changeState(3);
              },
              icon: Icons.notifications_none,
              title: _notifyText,
            ),
            SettingsTile(
              navigateTab: () {
                Navigator.of(context).pushNamed(CustomerSupportPage.pageName);
              },
              icon: Icons.mode_comment_outlined,
              title: _customerSupport,
            ),
            SizedBox(
              height: height * _spacing,
            )
          ],
        ),
      ),
    );
  }
}
