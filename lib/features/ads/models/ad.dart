import 'package:flutter/material.dart';

@immutable
class AdModel {
  final String image;
  final String description;
  final String status;
  const AdModel({
    required this.image,
    required this.description,
    required this.status,
  });
}
