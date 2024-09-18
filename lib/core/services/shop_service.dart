import 'package:aislecheck/core/constants/strings/firebase_constants.dart';
import 'package:aislecheck/features/register_shop/models/shop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShopService {
  static ShopService? _shopService;
  ShopService._internal();
  factory ShopService() {
    return _shopService ??= ShopService._internal();
  }

  Future<void> addShop({required Shop shop, required String id}) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.shopCollection)
        .doc(id)
        .set(
          shop.toMap(),
        );
  }
}
