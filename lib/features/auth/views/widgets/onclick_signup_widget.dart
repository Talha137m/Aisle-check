import 'package:aislecheck/core/constants/images_path.dart';
import 'package:flutter/material.dart';

class OnclickSignupWidget extends StatelessWidget {
  final double width, height;
  final VoidCallback googleSignIn;
  final VoidCallback appleSignIn;
  final VoidCallback emailSignIn;
  final VoidCallback facebookSignin;
  const OnclickSignupWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.emailSignIn,
      required this.facebookSignin,
      required this.appleSignIn,
      required this.googleSignIn});
  static const double _iconWidth = 0.12;
  static const double _iconHeight = 0.15;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: facebookSignin,
          child: Image.asset(
            CustmoerImages.facebookIcon,
            width: width * _iconWidth,
            height: height * _iconHeight,
            fit: BoxFit.contain,
          ),
        ),
        InkWell(
          onTap: googleSignIn,
          child: Image.asset(
            CustmoerImages.googleIcon,
            width: width * _iconWidth,
            height: height * _iconHeight,
            fit: BoxFit.contain,
          ),
        ),
        InkWell(
          onTap: appleSignIn,
          child: Image.asset(
            CustmoerImages.appleIcon,
            width: width * _iconWidth,
            height: height * _iconHeight,
            fit: BoxFit.contain,
          ),
        ),
        InkWell(
          onTap: emailSignIn,
          child: Image.asset(
            CustmoerImages.emailIcon,
            width: width * _iconWidth,
            height: height * _iconHeight,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
