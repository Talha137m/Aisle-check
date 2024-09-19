import 'package:aislecheck/core/constants/strings/firebase_constants.dart';
import 'package:aislecheck/core/services/session_manage_service.dart';
import 'package:aislecheck/features/add_inventory/models/inventry_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadInventryService {
  static UploadInventryService? _instance;
  UploadInventryService._();
  factory UploadInventryService() {
    return _instance ??= UploadInventryService._();
  }
  final SessionManageService _sessionManageService = SessionManageService();
  Future<bool> uploadInventry(InventryModel inventryModel) async {
    String? uId = await _sessionManageService.getAdminUid();
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

  Future<List<InventryModel>> fetchInventry() async {
    String? uId = await _sessionManageService.getAdminUid();
    QuerySnapshot<Map<String, dynamic>> products = await FirebaseFirestore
        .instance
        .collection(FirebaseConstants.inventryCollection)
        .doc(uId)
        .collection(FirebaseConstants.inventryCollection)
        .get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> data = products.docs;
    return data.map((e) => InventryModel.fromMap(e.data())).toList();
  }
}
