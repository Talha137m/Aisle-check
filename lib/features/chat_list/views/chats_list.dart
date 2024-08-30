import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/features/chat_list/views/widgets/chats_detail_widgets.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});
  //....PAGE NAME
  static const pageName = '/chat_list_page';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RecentsText(),
          const RecentsList(recentChatModels: AppDummyData.recentsList),
          RecentChatsContactsList(
              chatModels: AppDummyData.recentChatContactsList),
        ],
      ),
    );
  }
}
