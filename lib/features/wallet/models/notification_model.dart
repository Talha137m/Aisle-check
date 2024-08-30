// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class NotificationModel {
  final Color backgroundColor;
  final String title;
  final String text;
  final DateTime time;
  const NotificationModel({
    required this.backgroundColor,
    required this.title,
    required this.text,
    required this.time,
  });
}
