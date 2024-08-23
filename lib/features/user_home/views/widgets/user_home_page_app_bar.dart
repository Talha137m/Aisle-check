import 'package:aislecheck/core/constants/images_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHomePageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final double width, height;
  const UserHomePageAppBar(
      {super.key, required this.width, required this.height});
  static const double _heightRate = 0.02;
  static const double _widthRate = 0.04;
  static const double _dividerThickness=0.5;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Image.asset(CustmoerImages.rightIcon),
        SizedBox(
          height: height * _heightRate,
          child: const VerticalDivider(
            thickness: _dividerThickness,
          ),
        ),
        Image.asset(CustmoerImages.leftIcon),
        SizedBox(
          width: width * _widthRate,
        )
      ],
      leading: const Icon(Icons.menu),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello username\u{1F44B}',
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          Text(
            'Enjoy shopping with us !',
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 14),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
