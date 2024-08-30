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
    return Scaffold(
      appBar: const ChatPageAppBar(),
      body: Column(
        children: [
          const Expanded(
            child: MessagesList(),
          ),
          SizedBox(
            height: height * _pointEelvenPercent,
            child: const PersonalChatTextFieldAndButton(),
          ),
        ],
      ),
    );
  }
}
