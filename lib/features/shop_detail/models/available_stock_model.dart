import 'package:flutter/material.dart';

@immutable
class StockModel {
  final String image;
  final String name;
  final String price;
  final String reviews;
  const StockModel({
    required this.image,
    required this.name,
    required this.price,
    required this.reviews,
  });
}
