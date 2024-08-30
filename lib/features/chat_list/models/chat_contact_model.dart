// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

@immutable
class ChatContactModel {
  final String image;
  final String username;
  final String lastMessage;
  final DateTime time;
  const ChatContactModel({
    required this.image,
    required this.username,
    required this.lastMessage,
    required this.time,
  });
}
