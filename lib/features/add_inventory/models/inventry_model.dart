// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InventryModel {
  String productName;
  String productCategory;
  String productImage;
  num quantity;
  num price;
  String productId;
  String stockSituation;
  DateTime updatedAt;
  InventryModel({
    required this.productName,
    required this.productCategory,
    required this.productImage,
    required this.quantity,
    required this.price,
    required this.productId,
    required this.stockSituation,
    required this.updatedAt,
  });

  InventryModel copyWith({
    String? productName,
    String? productCategory,
    String? productImage,
    num? quantity,
    num? price,
    String? productId,
    String? stockSituation,
    DateTime? updatedAt,
  }) {
    return InventryModel(
      productName: productName ?? this.productName,
      productCategory: productCategory ?? this.productCategory,
      productImage: productImage ?? this.productImage,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      productId: productId ?? this.productId,
      stockSituation: stockSituation ?? this.stockSituation,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'productCategory': productCategory,
      'productImage': productImage,
      'quantity': quantity,
      'price': price,
      'productId': productId,
      'stockSituation': stockSituation,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory InventryModel.fromMap(Map<String, dynamic> map) {
    return InventryModel(
      productName: map['productName'] as String,
      productCategory: map['productCategory'] as String,
      productImage: map['productImage'] as String,
      quantity: map['quantity'] as num,
      price: map['price'] as num,
      productId: map['productId'] as String,
      stockSituation: map['stockSituation'] as String,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory InventryModel.fromJson(String source) =>
      InventryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InventryModel(productName: $productName, productCategory: $productCategory, productImage: $productImage, quantity: $quantity, price: $price, productId: $productId, stockSituation: $stockSituation, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant InventryModel other) {
    if (identical(this, other)) return true;

    return other.productName == productName &&
        other.productCategory == productCategory &&
        other.productImage == productImage &&
        other.quantity == quantity &&
        other.price == price &&
        other.productId == productId &&
        other.stockSituation == stockSituation &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return productName.hashCode ^
        productCategory.hashCode ^
        productImage.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        productId.hashCode ^
        stockSituation.hashCode ^
        updatedAt.hashCode;
  }
}
