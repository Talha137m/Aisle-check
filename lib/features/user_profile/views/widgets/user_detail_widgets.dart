import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';
import 'package:aislecheck/features/user_profile/views/option_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//...........PROFILE PIC AND NAME
class UserInfo extends StatelessWidget {
  const UserInfo(
      {super.key,
      required this.email,
      required this.image,
      required this.name});
  final String image, name, email;
  //...CONSTANT VALUES
  static const _borderPadding = 0.005;
  static const _containerWidth = 0.25;
  static const _containerHeight = 0.15;
  static const _blurAndSpreadRadius = 2.0;
  static const _shadowOffset = Offset(1, 1);
  static const _imageRaius = 0.04;
  static const _fontSize = 0.03;
  //...CONSTANT VALUES
  static const _flexOne = 1;
  static const _flexTwo = 2;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Expanded(
          flex: _flexOne,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: width * _containerWidth,
                height: height * _containerHeight,
                padding: EdgeInsets.all(
                  height * _borderPadding,
                ),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: _blurAndSpreadRadius,
                      spreadRadius: _blurAndSpreadRadius,
                      offset: _shadowOffset,
                    )
                  ],
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: height * _imageRaius,
                  backgroundImage: AssetImage(
                    image,
                  ),
                )),
          ),
        ),
        Expanded(
            flex: _flexTwo,
            child: Column(
              children: [
                Expanded(
                  flex: _flexOne,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      name,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: height * _fontSize,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: _flexOne,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      email,
                      style: GoogleFonts.roboto(
                        color: AppColors.grayColor,
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}

//..........FAVOURITE AND PROMO CONTAINERS
class FavAndPromoRow extends StatelessWidget {
  const FavAndPromoRow({super.key});
  //...CONSTANT VALUES
  static const _fav = 'Favourites';
  static const _promo = 'Promotion';
  //...CONSTANT FLEX SIZES
  static const _flexOne = 1;
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: _flexOne,
          child: OptionContainer(icon: CustmoerImages.star, text: _fav),
        ),
        Expanded(
          flex: _flexOne,
          child: OptionContainer(icon: CustmoerImages.promo, text: _promo),
        ),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {super.key,
      required this.icon,
      required this.title,
      this.navigateTab,
      this.pageName = UserHomePage.name});
  final IconData icon;
  final String title, pageName;
  final VoidCallback? navigateTab;
  //....CONSTANT VALUES
  static const _fontSize = 0.02;
  static const _iconSize = 0.045;
  static const _tileGap = 0.03;
  static const _contentPadding = 0.1;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return ListTile(
      onTap: navigateTab,
      leading: Icon(
        icon,
        size: height * _iconSize,
      ),
      horizontalTitleGap: width * _tileGap,
      contentPadding: EdgeInsets.only(
        right: width * _contentPadding,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: height * _fontSize,
        ),
      ),
    );
  }
}
