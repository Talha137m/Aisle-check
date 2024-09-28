import 'package:aislecheck/config/service_locator.dart';
import 'package:aislecheck/core/constants/strings/firebase_constants.dart';
import 'package:aislecheck/core/services/session_manage_service.dart';
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
    String? uid = locator.get<SessionManageService>().getAdminUid();
    QuerySnapshot<Map<String, dynamic>> adminQuerySnapshot =
        await FirebaseFirestore.instance
            .collection(FirebaseConstants.adminProfileCollection)
            .where('adminId', isNotEqualTo: uid)
            .get();

    List<AdminModel> adminList = adminQuerySnapshot.docs
        .map((adminDoc) => AdminModel.fromMap(adminDoc.data()))
        .toList();
    return adminList;
  }

  Future<AdminModel> getAdminById() async {
    String? uid = locator.get<SessionManageService>().getAdminUid();
    DocumentSnapshot<Map<String, dynamic>> adminDoc = await FirebaseFirestore
        .instance
        .collection(FirebaseConstants.adminProfileCollection)
        .doc(uid)
        .get();
    return AdminModel.fromMap(adminDoc.data() ?? {});
  }
}
