import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/features/personal_chat/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/images_path.dart';
import '../../../../core/constants/strings/app_colors.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({super.key, required this.message});
  final String message;
  //.....CONSTANT VALUES
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
  static const _elevation = 15.0;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final ChatController messageController = context.watch<ChatController>();
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width * _pointNinePercent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width * _pointZeroTwoPercent,
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
                    child: switch (messageController.state) {
                      SendMessagesInitialState() => _iconWidget(),
                      SendMessagesLoadingState() => const LoadingWidget(),
                      SendMessagesSuccessState() => _iconWidget(),
                      SendMessagesErrorState() => _iconWidget(),
                    }),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Card(
                elevation: _elevation,
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: _borderRadiusTwenty,
                    bottomLeft: _borderRadiusTwenty,
                    bottomRight: _borderRadiusTwenty,
                  ),
                ),
                color: AppColors.whiteColor,
                margin: EdgeInsets.only(
                  left: width * _pointZeroTwoPercent,
                  right: width * _pointZeroTwoPercent,
                  top: height * _pointZeroFivePercent,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * _pointOneThreePercent,
                    vertical: height * _pointZeroTwoPercent,
                  ),
                  child: Text(
                    message,
                    style: GoogleFonts.roboto(
                      fontSize: _fontSizeFourteen,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _iconWidget() {
    return Image.asset(
      AdminImages.adam,
      fit: BoxFit.fill,
    );
  }
}
