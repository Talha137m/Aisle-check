import 'package:aislecheck/core/constants/strings/firebase_constants.dart';
import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:aislecheck/features/add_inventory/models/inventry_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InventryService {
  static InventryService? _instance;
  InventryService._();
  factory InventryService() {
    return _instance ??= InventryService._();
  }
  final SessionManageService _sessionManageService = SessionManageService();
  Future<bool> uploadInventry(InventryModel inventryModel) async {
    String? uId = _sessionManageService.getAdminUid();
    if (uId == null) {
      return false;
    }
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.inventryCollection)
        .doc(uId)
        .collection(FirebaseConstants.inventryCollection)
        .doc(inventryModel.productId)
        .set(inventryModel.toMap());
    return true;
  }

  Future<List<InventryModel>> fetchInventry({
    required int limit,
    DocumentSnapshot? lastDocument,
  }) async {
    String? uId = _sessionManageService.getAdminUid();
    Query products = FirebaseFirestore.instance
        .collection(FirebaseConstants.inventryCollection)
        .doc(uId)
        .collection(FirebaseConstants.inventryCollection)
        .orderBy('updatedAt', descending: false)
        .limit(limit);
    if (lastDocument != null) {
      products = products.startAfterDocument(lastDocument);
    }
    QuerySnapshot<Map<String, dynamic>> data =
        await products.get() as QuerySnapshot<Map<String, dynamic>>;
    return data.docs
        .map((e) => InventryModel.fromMap(e.data()))
        .toList();
  }

  CollectionReference<InventryModel> fetchInventr() {
    String? uId = _sessionManageService.getAdminUid();
    CollectionReference<InventryModel> products = FirebaseFirestore.instance
        .collection(FirebaseConstants.inventryCollection)
        .doc(uId)
        .collection(FirebaseConstants.inventryCollection)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              InventryModel.fromMap(snapshot.data() ?? {}),
          toFirestore: (inventry, options) => inventry.toMap(),
        );
    return products;
  }
}
