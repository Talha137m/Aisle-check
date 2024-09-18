import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/email_verfication/controllers/email_verfication_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailVerficationWidget extends StatelessWidget {
  final String email;
  final EmailVerficationController emailVerficationController;
  const EmailVerficationWidget(
      {super.key,
      required this.email,
      required this.emailVerficationController});
  //constants values....
  static const double _iconSize = 50;
  static const double _textSize = 16;
  static const String _textOne = 'Please verify your email';
  static const double _headingFontSize = 22;
  static const String _textMessage =
      'You\'re almost there! We sent an email to';
  static const String _description =
      'Just click on the link in that email to complete your signup.If you don\'t see it, you may need to check your spam folder.';
  static const String _resendEmailMsg = 'Resend Verification Email';
  static const _gapValue = 0.05;
  static const _textGap = 0.02;
  static const double _paddingValue = 10;
  static const double _verticalAlign = -0.5;
  static const double _horizontalAlign = 0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Align(
      alignment: const Alignment(_horizontalAlign, _verticalAlign),
      child: Padding(
        padding: const EdgeInsets.all(_paddingValue),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.email,
              size: _iconSize,
              color: AppColors.greenColor,
            ),
            SizedBox(
              height: height * _gapValue,
            ),
            Text(
              _textOne,
              style: GoogleFonts.roboto(
                fontSize: _headingFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * _textGap,
            ),
            Text(
              _textMessage,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: AppColors.black54Color,
                fontSize: _textSize,
              ),
            ),
            Text(
              email,
              style: GoogleFonts.roboto(
                color: AppColors.black54Color,
                fontSize: _textSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * _textGap,
            ),
            Text(
              _description,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: _textSize,
                color: AppColors.black54Color,
              ),
            ),
            SizedBox(
              height: height * _gapValue,
            ),
            AppCompactBtn(
              btnName: _resendEmailMsg,
              btnBackgroundColor: AppColors.grayColor,
              onTap: () {
                emailVerficationController.verficationEmail();
              },
            ),
            SizedBox(
              height: height * _gapValue,
            ),
            AppCompactBtn(
              btnName: 'Sign in ->',
              onTap: () {
                emailVerficationController.verficationEmail();
              },
            ),
          ],
        ),
      ),
    );
  }
}
