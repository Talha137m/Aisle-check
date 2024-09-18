import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirestorageService {
  static FirestorageService? _firestorageService;
  FirestorageService._internal();
  factory FirestorageService() {
    return _firestorageService ??= FirestorageService._internal();
  }
  Future<String> uploadAdminProfileImg(String adminId, File file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String path = 'adminPofile/$adminId';
    TaskSnapshot task = await storage.ref(path).putFile(file);
    String url = await task.ref.getDownloadURL();
    return url;
  }

  Future<String> uploadShopImg(String adminId, File file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String path = 'shops/$adminId';
    TaskSnapshot task = await storage.ref(path).putFile(file);
    String url = await task.ref.getDownloadURL();
    return url;
  }
}
