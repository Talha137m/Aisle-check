import 'dart:developer';

import 'package:aislecheck/config/service_locator.dart';
import 'package:aislecheck/core/services/chat_service.dart';
import 'package:flutter/material.dart';

//...messages sends states
@immutable
sealed class SendMessagesState {}

@immutable
final class SendMessagesInitialState extends SendMessagesState {}

@immutable
final class SendMessagesLoadingState extends SendMessagesState {}

@immutable
final class SendMessagesSuccessState extends SendMessagesState {}

@immutable
final class SendMessagesErrorState extends SendMessagesState {
  final String error;
  SendMessagesErrorState({required this.error});
}

class ChatController extends ChangeNotifier {
  //...states
  SendMessagesState _state = SendMessagesInitialState();
  SendMessagesState get state => _state;
  void _setState(SendMessagesState state) {
    _state = state;
    notifyListeners();
  }

  //...text editing controller
  final TextEditingController _messageController = TextEditingController();
  TextEditingController get messageController => _messageController;
  void clearMessage() {
    _messageController.clear();
  }

  final ChatService _chatService = locator.get<ChatService>();

  void sendMessages(String receiverId) async {
    try {
      if (_messageController.text.isEmpty) {
        log('ndvjksdnvjksdnvjksdnvjknsdjk:::${_messageController}');
        return;
      }
      _setState(SendMessagesLoadingState());
      await _chatService.sendMessage(receiverId, _messageController.text);
      _messageController.clear();
      _setState(SendMessagesSuccessState());
    } catch (e) {
      log(e.toString());
      _setState(SendMessagesErrorState(error: 'Something went wrong'));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }
}
