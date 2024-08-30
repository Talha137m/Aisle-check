import 'package:aislecheck/core/common/widgets/app_compat_btn.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/wallet/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//......TOTAL BALANCE TEXT
class TotalBalanceText extends StatelessWidget {
  const TotalBalanceText({super.key});
  //.....CONSTANT VALUE
  static const _totalBalanceText = 'Total Balance';
  static const _balance = '\$500.00';
  static const _btnText = 'Withdraw';
  static const _notificationsText = 'All Notifications';
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroFivePercent = 0.05;
  static const _fontSizeTwenty = 20.0;
  static const _fontSizeThirty = 30.0;
  static const _btnRadius = 30.0;
  static const _btnHeight = 0.07;
  static const _fontSizeSixteen = 16.0;
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
            _balance,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
              fontSize: _fontSizeThirty,
            ),
          ),
          SizedBox(
            height: height * _pointZeroTwoPercent,
          ),
          Row(
            children: [
              Icon(
                Icons.circle_outlined,
                color: AppColors.greenColor,
                size: height * 0.02,
              ),
              Expanded(
                child: Text(
                  ' $_totalBalanceText',
                  style: GoogleFonts.roboto(
                    fontSize: _fontSizeSixteen,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: height * _pointZeroTwoFivePercent,
          ),
          AppCompactBtn(
            onTap: () {},
            btnHeight: _btnHeight,
            borderRadius: _btnRadius,
            btnName: _btnText,
            isTextBold: true,
          ),
          SizedBox(
            height: height * _pointZeroFivePercent,
          ),
          Text(
            _notificationsText,
            style: GoogleFonts.roboto(
              color: AppColors.blackColor,
              fontSize: _fontSizeTwenty,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({super.key, required this.notifications});
  final List<NotificationModel> notifications;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notifications.length,
      itemBuilder: (context, index) => NotificationListTile(
        notification: notifications[index],
      ),
    );
  }
}

//.....NOTIFICATION Tile
class NotificationListTile extends StatelessWidget {
  const NotificationListTile({super.key, required this.notification});
  final NotificationModel notification;
  //....CONATNT VALUES
  static const _fontSizeTen = 10.0;
  static const _fontSizeTwelve = 12.0;
  static const _fontSizeFifteen = 15.0;
  static const _pointZeroThreePercent = 0.03;
  @override
  Widget build(BuildContext context) {
    final Size(:height, :width) = MediaQuery.sizeOf(context);
    return ListTile(
      leading: CircleAvatar(
        radius: height * _pointZeroThreePercent,
        backgroundColor: notification.backgroundColor,
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: width * 0.55,
          child: FittedBox(
            child: Text(
              notification.title,
              style: GoogleFonts.roboto(
                fontSize: _fontSizeFifteen,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      subtitle: Text(
        notification.text,
        style: GoogleFonts.roboto(
          fontSize: _fontSizeTen,
          color: AppColors.grayColor,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${notification.time.hour}:${notification.time.minute}',
            style: GoogleFonts.roboto(
              fontSize: _fontSizeTwelve,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(
            height: height * 0.03,
          )
        ],
      ),
    );
  }
}
