import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/strings/app_colors.dart';

//...............HEADINGS
class CancellationPageHeadings extends StatelessWidget {
  const CancellationPageHeadings({super.key});
  //...CONSTANT VALUES
  static const _cancellationText = 'Subscription Cancellation';
  static const _surveyText = 'Complete the following survey :';
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroFivePercent = 0.05;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _fontSizeFifteen = 15.0;
  static const _fontSizeTwenty = 20.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * _pointZeroFivePercent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * _pointZeroTwoFivePercent,
          ),
          Text(
            _cancellationText,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: _fontSizeTwenty,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(
            height: height * _pointZeroOnePercent,
          ),
          Text(
            _surveyText,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              fontSize: _fontSizeFifteen,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}

//.....CHECK BOXES ROW
class CancellationPageCheckBoxes extends StatelessWidget {
  const CancellationPageCheckBoxes({super.key});
  //....CONATANT VALUES
  static const _firstReason = 'I no longer need the service.';
  static const _secondReason = 'The subscription is too expensive.';
  static const _thirdReason = 'I didn\'t use the app as much as i expected.';
  static const _fourthReason =
      'I had technical issues or problems using the app.';
  static const _fifthReason = 'I found a better alternative.';
  static const _sixthReason =
      'I\'m  not satisfied with the app\'s features or performamce.';
  static const _pointZeroOnePercent = 0.01;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * _pointZeroOnePercent),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CancellationPageCheckBox(
            text: _firstReason,
          ),
          CancellationPageCheckBox(
            text: _secondReason,
          ),
          CancellationPageCheckBox(
            text: _thirdReason,
          ),
          CancellationPageCheckBox(
            text: _fourthReason,
          ),
          CancellationPageCheckBox(
            text: _fifthReason,
          ),
          CancellationPageCheckBox(
            text: _sixthReason,
          ),
        ],
      ),
    );
  }
}

//..........CHECK BOX
class CancellationPageCheckBox extends StatefulWidget {
  const CancellationPageCheckBox({super.key, required this.text});
  final String text;

  @override
  State<CancellationPageCheckBox> createState() =>
      _CancellationPageCheckBoxState();
}

class _CancellationPageCheckBoxState extends State<CancellationPageCheckBox> {
  var isChecked = false;
  //.....CONSTANT VALUES
  static const _fontStyle = 12.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            isChecked = value!;
            setState(() {});
          },
        ),
        Expanded(
          child: Text(
            widget.text,
            style: GoogleFonts.roboto(
              fontSize: _fontStyle,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
