import 'package:aislecheck/core/common/widgets/error_msg_widget.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/constants/dummy_data.dart';
import 'package:aislecheck/features/chat_list/controllers/contacts_controller.dart';
import 'package:aislecheck/features/chat_list/views/widgets/chats_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});
  //....PAGE NAME
  static const pageName = '/chat_list_page';

  @override
  Widget build(BuildContext context) {
    ContactsController contactsController = context.watch<ContactsController>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RecentsText(),
          const RecentsList(recentChatModels: AppDummyData.recentsList),
          switch (contactsController.state) {
            ContactsLoading() => LoadingWidget(
                event: () {
                  contactsController.getAllContacts();
                },
              ),
            ContactsLoaded() => RecentChatsContactsList(
                chatModels:
                    (contactsController.state as ContactsLoaded).admins),
            ContactsError() => ErrorMessageWidget(
                onRetry: () {
                  contactsController.getAllContacts();
                },
                title: 'Failed',
                message: (contactsController.state as ContactsError)
                    .message
                    .toString(),
              ),
          }
        ],
      ),
    );
  }
}
