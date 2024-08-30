// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

@immutable
class RecentChatModel {
  final String image;
  final String name;
  const RecentChatModel({
    required this.image,
    required this.name,
  });
}
