// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddAdminModel {
  String name;
  String email;
  String adminId;
  String? deviceToken;
  String? phoneNo;
  String? imageUrl;
  AddAdminModel({
    required this.name,
    required this.email,
    required this.adminId,
    this.deviceToken,
    this.phoneNo,
    this.imageUrl,
  });

  AddAdminModel copyWith({
    String? name,
    String? email,
    String? adminId,
    String? deviceToken,
    String? phoneNo,
    String? imageUrl,
  }) {
    return AddAdminModel(
      name: name ?? this.name,
      email: email ?? this.email,
      adminId: adminId ?? this.adminId,
      deviceToken: deviceToken ?? this.deviceToken,
      phoneNo: phoneNo ?? this.phoneNo,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'adminId': adminId,
      'deviceToken': deviceToken,
      'phoneNo': phoneNo,
      'imageUrl': imageUrl,
    };
  }

  factory AddAdminModel.fromMap(Map<String, dynamic> map) {
    return AddAdminModel(
      name: map['name'] as String,
      email: map['email'] as String,
      adminId: map['adminId'] as String,
      deviceToken: map['deviceToken'] as String,
      phoneNo: map['phoneNo'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddAdminModel.fromJson(String source) =>
      AddAdminModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddAdmin(name: $name, email: $email, adminId: $adminId, deviceToken: $deviceToken, phoneNo: $phoneNo, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant AddAdminModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.adminId == adminId &&
        other.deviceToken == deviceToken &&
        other.phoneNo == phoneNo &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        adminId.hashCode ^
        deviceToken.hashCode ^
        phoneNo.hashCode ^
        imageUrl.hashCode;
  }
}
