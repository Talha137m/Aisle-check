// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesModel {
  final String senderId;
  final String receiverId;
  final String senderEmail;
  final String message;
  final Timestamp timestamp;
  final String? currentUserImageUrl;
  MessagesModel({
    required this.senderId,
    required this.receiverId,
    required this.senderEmail,
    required this.message,
    required this.timestamp,
    this.currentUserImageUrl,
  });

  MessagesModel copyWith({
    String? senderId,
    String? receiverId,
    String? senderEmail,
    String? message,
    Timestamp? timestamp,
    String? currentUserImageUrl,
  }) {
    return MessagesModel(
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      senderEmail: senderEmail ?? this.senderEmail,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      currentUserImageUrl: currentUserImageUrl ?? this.currentUserImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'receiverId': receiverId,
      'senderEmail': senderEmail,
      'message': message,
      'timestamp': timestamp,
      'currentUserImageUrl': currentUserImageUrl,
    };
  }

  factory MessagesModel.fromMap(Map<String, dynamic> map) {
    return MessagesModel(
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      senderEmail: map['senderEmail'] as String,
      message: map['message'] as String,
      timestamp: map['timestamp'] as Timestamp,
      currentUserImageUrl: map['currentUserImageUrl'] != null
          ? map['currentUserImageUrl'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessagesModel.fromJson(String source) =>
      MessagesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessagesModel(senderId: $senderId, receiverId: $receiverId, senderEmail: $senderEmail, message: $message, timestamp: $timestamp, currentUserImageUrl: $currentUserImageUrl)';
  }

  @override
  bool operator ==(covariant MessagesModel other) {
    if (identical(this, other)) return true;

    return other.senderId == senderId &&
        other.receiverId == receiverId &&
        other.senderEmail == senderEmail &&
        other.message == message &&
        other.timestamp == timestamp &&
        other.currentUserImageUrl == currentUserImageUrl;
  }

  @override
  int get hashCode {
    return senderId.hashCode ^
        receiverId.hashCode ^
        senderEmail.hashCode ^
        message.hashCode ^
        timestamp.hashCode ^
        currentUserImageUrl.hashCode;
  }
}
