import 'package:aislecheck/config/service_locator.dart';
import 'package:aislecheck/core/common/widgets/error_msg_widget.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/services/chat_service.dart';
import 'package:aislecheck/features/auth/admin_auth/models/add_admin_model.dart';
import 'package:aislecheck/features/chat_list/models/messages_model.dart';
import 'package:aislecheck/features/personal_chat/views/widgets/chat_page_textfield.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_detail_widgets.dart';

class PersonalChatPage extends StatelessWidget {
  const PersonalChatPage({super.key});
  //.....PAGE NAME
  static const pageName = '/personal_chat_page';
  //....CONSTANT VALUES
  static const _pointEelvenPercent = 0.11;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    AdminModel adminModel =
        ModalRoute.of(context)?.settings.arguments as AdminModel;
    return Scaffold(
      appBar: ChatPageAppBar(adminModel: adminModel),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
            stream: locator.get<ChatService>().getMessages(adminModel.adminId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ErrorMessageWidget(
                  title: 'Failed!',
                  message: snapshot.error.toString(),
                  onRetry: () {
                    locator.get<ChatService>().getMessages(adminModel.adminId);
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else {
                List<MessagesModel> messages = snapshot.data!.docs
                    .map((e) =>
                        MessagesModel.fromMap(e.data() as Map<String, dynamic>))
                    .toList();
                return MessagesList(
                  adminModel: adminModel,
                  messagesModel: messages,
                );
              }
            },
          )),
          SizedBox(
            height: height * _pointEelvenPercent,
            child: PersonalChatTextFieldAndButton(adminModel: adminModel),
          ),
        ],
      ),
    );
  }
}
