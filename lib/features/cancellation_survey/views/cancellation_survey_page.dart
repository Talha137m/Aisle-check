import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/text_field_widget.dart';
import 'package:aislecheck/features/cancellation_survey/views/widgets/cancellation_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/strings/app_colors.dart';

class CancellationSurveyPage extends StatelessWidget {
  const CancellationSurveyPage({super.key});
  //.....PAGE NAME
  static const pageName = '/cancellation_survey_page';
  //....CONATNT VALUES
  static const _title = 'Ads';
  static const _otherText = 'If other, please specify here';
  static const _btnText = 'Submit';
  static const _hintText = 'write something here...';
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroFivePercent = 0.05;
  static const _fontSizeTwelve = 12.0;
  static const _fieldHeight = 0.2;
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: GlobalAppBar(titleText: _title),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CancellationPageHeadings(),
            SizedBox(
              height: height * _pointZeroTwoPercent,
            ),
            const CancellationPageCheckBoxes(),
            SizedBox(
              height: height * _pointZeroTwoFivePercent,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * _pointZeroFivePercent,
              ),
              child: Text(
                _otherText,
                style: GoogleFonts.roboto(
                  fontSize: _fontSizeTwelve,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: height * _pointZeroOnePercent,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * _pointZeroFivePercent,
              ),
              child: AdminAppCompactTextField(
                controller: TextEditingController(),
                hintText: _hintText,
                validator: (value) {
                  return null;
                },
                fieldHeight: _fieldHeight,
                fillColor: AppColors.whiteColor,
                textAlignment: TextAlignVertical.top,
                borderColor: AppColors.grayColor,
                borderWidth: 1.0,
                expands: true,
                hintColor: AppColors.grayColor,
              ),
            ),
            SizedBox(
              height: height * _pointZeroFivePercent,
            ),
            Center(
              child: AppCompactBtn(
                onTap: () {},
                btnName: _btnText,
                btnHeight: _btnHeight,
                borderRadius: _btnRadius,
                isTextBold: true,
              ),
            ),
            SizedBox(
              height: height * _pointZeroFivePercent,
            ),
          ],
        ),
      ),
    );
  }
}
