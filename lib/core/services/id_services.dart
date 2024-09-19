import 'package:firebase_messaging/firebase_messaging.dart';

class IdServices {
  static IdServices? _idServices;
  IdServices._internal();
  factory IdServices() {
    return _idServices ??= IdServices._internal();
  }
  Future<String?> getDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }

  String generateIdForProduct(String productName) {
    return '${productName}_${DateTime.now().millisecondsSinceEpoch}';
  }
}
