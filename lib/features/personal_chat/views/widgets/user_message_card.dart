import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/images_path.dart';

class UserMessageCard extends StatelessWidget {
  const UserMessageCard({super.key, required this.message});
  final String message;
  //....CONSTANT VALUES
  static const _borderRadiusTwenty = Radius.circular(20.0);
  static const _borderRadiusTen = 10.0;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroThreePercent = 0.03;
  static const _pointZeroFivePercent = 0.05;
  static const _pointZeroSixPercent = 0.06;
  static const _pointElevenPercent = 0.11;
  static const _pointOneThreePercent = 0.13;
  static const _pointNinePercent = 0.9;
  static const _fontSizeFourteen = 14.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width * _pointNinePercent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Card(
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: _borderRadiusTwenty,
                      bottomLeft: _borderRadiusTwenty,
                      bottomRight: _borderRadiusTwenty,
                    ),
                  ),
                  color: AppColors.greenColor,
                  //...difference between messages
                  margin: EdgeInsets.only(
                    right: width * _pointZeroTwoPercent,
                    left: width * _pointZeroTwoPercent,
                    top: height * _pointZeroFivePercent,
                  ),
                  child: Padding(
                    //..inner message padding
                    padding: EdgeInsets.symmetric(
                      horizontal: width * _pointOneThreePercent,
                      vertical: height * _pointZeroTwoPercent,
                    ),
                    child: Text(
                      message,
                      style: GoogleFonts.roboto(
                        fontSize: _fontSizeFourteen,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * _pointZeroThreePercent),
              child: SizedBox(
                height: height * _pointZeroSixPercent,
                width: width * _pointElevenPercent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    _borderRadiusTen,
                  ),
                  child: Image.asset(
                    AdminImages.adam,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * _pointZeroTwoPercent,
            )
          ],
        ),
      ),
    );
  }
}
