import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/images_path.dart';
import 'sender_message_card.dart';
import 'user_message_card.dart';

//......NAME AND STATUS
class UserNameAndStatus extends StatelessWidget {
  const UserNameAndStatus({super.key});
  //.....CONSTANT VALUES
  static const _fontSizeFourteen = 14.0;
  //.....CONSTANT VALUES
  static const _flexTwo = 2;
  static const _flexTen = 10;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(
          flex: _flexTwo,
        ),
        Expanded(
          flex: _flexTen,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Kathryn Murphy',
              style: GoogleFonts.roboto(
                fontSize: _fontSizeFourteen,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Expanded(
          flex: _flexTen,
          child: Text(
            'user@123',
            style: GoogleFonts.roboto(
              fontSize: _fontSizeFourteen,
              color: AppColors.grayColor,
            ),
          ),
        )
      ],
    );
  }
}

//....CHAT PAGE APPBAR
class ChatPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatPageAppBar({super.key});
  //....CONSTANT VALUES
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroThreePercent = 0.03;
  static const _pointFiftyFivePercent = 0.55;
  //.....CONSTANT FLEX SIZES
  static const _flexFour = 4;
  static const _flexTen = 10;
  static const _flexTwenty = 20;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return AppBar(
      leadingWidth: width * _pointFiftyFivePercent,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: _flexFour,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: height * _pointZeroTwoFivePercent,
              ),
            ),
          ),
          Expanded(
            flex: _flexTen,
            child: CircleAvatar(
              radius: height * _pointZeroThreePercent,
              backgroundImage: const AssetImage(AdminImages.barryChat),
            ),
          ),
          const Expanded(
            flex: _flexTwenty,
            child: UserNameAndStatus(),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//.....MESSAGES LIST
class MessagesList extends StatelessWidget {
  const MessagesList({super.key});
  //....CONSTANT VALUES
  static const _pointZeroOneFour = 0.14;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: MediaQuery.sizeOf(context).height * _pointZeroOneFour,
      itemCount: AppDummyData.messages.length,
      itemBuilder: (context, index) {
        if (AppDummyData.messages[index]['isMe'] == true) {
          return UserMessageCard(
            message: AppDummyData.messages[index]['text'].toString(),
          );
        }
        return SenderMessageCard(
          message: AppDummyData.messages[index]['text'].toString(),
        );
      },
    );
  }
}
