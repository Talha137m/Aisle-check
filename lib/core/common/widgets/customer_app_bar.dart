import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  const CustomerAppBar({super.key, this.backgroundColor});

  static const _w5 = 0.5;
  static const double _fs16 = 16;
  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return AppBar(
      backgroundColor: backgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      actions: [
        Text(
          'Ads',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: _fs16,
              color: AppColors.blackColor),
        ),
        SizedBox(
          width: width * _w5,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
