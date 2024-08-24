// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class ScheduledProduct {
  final String image;
  final String productName;
  final int quantity;
  final num price;
  const ScheduledProduct({
    required this.image,
    required this.productName,
    required this.quantity,
    required this.price,
  });
}
