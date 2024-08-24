import 'package:aislecheck/core/constants/images_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        username: 'Talha', email: 'dummmy@gmail.com', image: CustmoerImages.emailIcon);
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
            const SettingsTile(
              icon: Icons.person_2_outlined,
              title: _profile,
            ),
            const SettingsTile(
              icon: Icons.timer_outlined,
              title: _browseHistory,
            ),
            const SettingsTile(
              icon: Icons.list,
              title: _shoppingList,
            ),
            const SettingsTile(
              icon: Icons.location_on,
              title: _mapText,
            ),
            const SettingsTile(
              icon: Icons.notifications_none,
              title: _notifyText,
            ),
            const SettingsTile(
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
