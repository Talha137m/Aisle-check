import 'package:flutter/material.dart';

@immutable
class AvailableStockModel {
  final String image;
  final String productName;
  final int currentStock;
  final String lastUpdated;
  final String stockSituation;
  const AvailableStockModel({
    required this.image,
    required this.productName,
    required this.currentStock,
    required this.lastUpdated,
    required this.stockSituation,
  });
}
