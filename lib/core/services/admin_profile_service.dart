
import 'package:aislecheck/core/constants/strings/firebase_constants.dart';
import 'package:aislecheck/features/auth/admin_auth/models/add_admin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminProfileService {
  static AdminProfileService? _adminProfileService;
  AdminProfileService._internal();
  factory AdminProfileService() {
    return _adminProfileService ??= AdminProfileService._internal();
  }

  Future<void> addAdmin(AdminModel addAdmin) async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.adminProfileCollection)
        .doc(addAdmin.adminId)
        .set(addAdmin.toMap());
  }

  Future<List<AdminModel>> getAdmin() async {
    QuerySnapshot<Map<String, dynamic>> adminQuerySnapshot =
        await FirebaseFirestore.instance
            .collection(FirebaseConstants.adminProfileCollection)
            .get();
    List<AdminModel> adminList = adminQuerySnapshot.docs
        .map((adminDoc) => AdminModel.fromMap(adminDoc.data()))
        .toList();
    return adminList;
  }
}
