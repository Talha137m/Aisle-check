import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/chat_list/models/chat_contact_model.dart';
import 'package:aislecheck/features/chat_list/models/recent_chat_model.dart';
import 'package:aislecheck/features/personal_chat/views/personal_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//......RECENT TEXT
class RecentsText extends StatelessWidget {
  const RecentsText({super.key});

  //...CONATANT VALUES
  static const _recent = 'Recent';
  static const _fontSizeTenEight = 10.88;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointZeroFivePercent = 0.05;
  @override
  Widget build(BuildContext context) {
    final Size(:height, :width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * _pointZeroFivePercent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * _pointZeroTwoFivePercent,
          ),
          Text(
            _recent,
            style: GoogleFonts.roboto(
              color: AppColors.blackColor,
              fontSize: _fontSizeTenEight,
            ),
          ),
          SizedBox(
            height: height * _pointZeroTwoPercent,
          ),
        ],
      ),
    );
  }
}

//......RECENT CHAT VIEW
class RecentChatView extends StatelessWidget {
  const RecentChatView({super.key, required this.recentChatModel});
  final RecentChatModel recentChatModel;
  //....CONATNT VALUES
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroThreeFivePercent = 0.035;
  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    return Column(
      children: [
        CircleAvatar(
          radius: height * _pointZeroThreeFivePercent,
          backgroundImage: AssetImage(recentChatModel.image),
        ),
        SizedBox(
          height: height * _pointZeroOnePercent,
        ),
        Text(
          recentChatModel.name,
        )
      ],
    );
  }
}

//....RECENT CHAT LIST
class RecentsList extends StatelessWidget {
  const RecentsList({super.key, required this.recentChatModels});
  final List<RecentChatModel> recentChatModels;
  //....CONATNT VALUES
  static const _pointZeroTwoPercent = 0.02;
  static const _pointOneThreePercent = 0.13;
  @override
  Widget build(BuildContext context) {
    final Size(:height, :width) = MediaQuery.sizeOf(context);
    return SizedBox(
      height: height * _pointOneThreePercent,
      child: ListView.builder(
        itemCount: recentChatModels.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width * _pointZeroTwoPercent),
          child: RecentChatView(
            recentChatModel: recentChatModels[index],
          ),
        ),
      ),
    );
  }
}

//....RECENT CHAT LIST TILE
class RecentChatListTile extends StatelessWidget {
  const RecentChatListTile({super.key, required this.chatModel});
  final ChatContactModel chatModel;
//....CONATNT VALUES
  static const _pointZeroTwoPercent = 0.02;
  static const _pointThreeFivePercent = 0.035;
  static const _fontSizeFourteenPointTwo = 14.2;
  static const _fontSizeThirteenPointTwoFive = 13.25;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PersonalChatPage.pageName);
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: height * _pointThreeFivePercent,
          backgroundImage: AssetImage(chatModel.image),
        ),
        title: Text(
          chatModel.username,
          style: GoogleFonts.roboto(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: _fontSizeFourteenPointTwo,
          ),
        ),
        subtitle: Text(
          chatModel.lastMessage,
          style: GoogleFonts.roboto(
            color: AppColors.grayColor,
            fontSize: _fontSizeThirteenPointTwoFive,
          ),
        ),
        trailing: Padding(
          padding: EdgeInsets.only(
            bottom: height * _pointZeroTwoPercent,
          ),
          child: Text(
            '${chatModel.time.hour}:${chatModel.time.minute}',
            style: GoogleFonts.roboto(
              color: AppColors.grayColor,
              fontSize: _fontSizeThirteenPointTwoFive,
            ),
          ),
        ),
      ),
    );
  }
}

//...RECENT CHATS CONTACT LIST
class RecentChatsContactsList extends StatelessWidget {
  const RecentChatsContactsList({super.key, required this.chatModels});
  final List<ChatContactModel> chatModels;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatModels.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => RecentChatListTile(
        chatModel: chatModels[index],
      ),
    );
  }
}
