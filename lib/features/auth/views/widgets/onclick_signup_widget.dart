import 'package:aislecheck/core/constants/images_path.dart';
import 'package:flutter/material.dart';

class OnclickSignupWidget extends StatelessWidget {
  final double width, height;
  const OnclickSignupWidget(
      {super.key, required this.width, required this.height});
  static const double _iconWidth = 0.12;
  static const double _iconHeight = 0.15;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          CustmoerImages.facebookIcon,
          width: width * _iconWidth,
          height: height * _iconHeight,
          fit: BoxFit.contain,
        ),
        Image.asset(
          CustmoerImages.googleIcon,
          width: width * _iconWidth,
          height: height * _iconHeight,
          fit: BoxFit.contain,
        ),
        Image.asset(
          CustmoerImages.appleIcon,
          width: width * _iconWidth,
          height: height * _iconHeight,
          fit: BoxFit.contain,
        ),
        Image.asset(
          CustmoerImages.emailIcon,
          width: width * _iconWidth,
          height: height * _iconHeight,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
