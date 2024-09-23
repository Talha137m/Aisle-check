import 'package:aislecheck/core/common/widgets/image_cached_widget.dart';
import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/auth/admin_auth/models/add_admin_model.dart';
import 'package:aislecheck/features/chat_list/models/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sender_message_card.dart';
import 'user_message_card.dart';

//......NAME AND STATUS
class UserNameAndStatus extends StatelessWidget {
  final AdminModel adminModel;
  const UserNameAndStatus({super.key, required this.adminModel});
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
              adminModel.name,
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
            adminModel.email,
            style: GoogleFonts.roboto(
              fontSize: _fontSizeFourteen,
              color: AppColors.grayColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

//....CHAT PAGE APPBAR
class ChatPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AdminModel adminModel;
  const ChatPageAppBar({super.key, required this.adminModel});
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
              child: Center(
                  child: switch (adminModel.imageUrl == null) {
                true => const Icon(
                    Icons.person,
                    color: AppColors.greenColor,
                  ),
                false => ImageCachedWidget(
                    image: adminModel.imageUrl!,
                    isAvatar: true,
                  ),
              }),
            ),
          ),
          Expanded(
            flex: _flexTwenty,
            child: UserNameAndStatus(
              adminModel: adminModel,
            ),
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
  final List<MessagesModel> messagesModel;
  final AdminModel adminModel;
  const MessagesList(
      {super.key, required this.messagesModel, required this.adminModel});
  //....CONSTANT VALUES
  static const _pointZeroOneFour = 0.14;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: MediaQuery.sizeOf(context).height * _pointZeroOneFour,
      itemCount: messagesModel.length,
      itemBuilder: (context, index) {
        if (messagesModel[index].senderId != adminModel.adminId) {
          return UserMessageCard(
            message: messagesModel[index].message,
            imageUrl: adminModel.imageUrl,
          );
        }
        return SenderMessageCard(
          message: messagesModel[index].message,
        );
      },
    );
  }
}
