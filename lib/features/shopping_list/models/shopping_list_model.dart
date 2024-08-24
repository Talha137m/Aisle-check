import 'package:flutter/material.dart';

@immutable
class ShoppingListModel {
  final String listName;
  final int totalItems;
  final num totalCost;
  final num progress;
  final String lastUpdated;
  const ShoppingListModel({
    required this.listName,
    required this.totalItems,
    required this.totalCost,
    required this.progress,
    required this.lastUpdated,
  });
}
