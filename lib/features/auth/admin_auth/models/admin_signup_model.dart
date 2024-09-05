// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdminSignUpModel {
  String name;
  String email;
  String phoneNo;
  String password;
  AdminSignUpModel({
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.password,
  });

  AdminSignUpModel copyWith({
    String? name,
    String? email,
    String? phoneNo,
    String? password,
  }) {
    return AdminSignUpModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNo': phoneNo,
      'password': password,
    };
  }

  factory AdminSignUpModel.fromMap(Map<String, dynamic> map) {
    return AdminSignUpModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNo: map['phoneNo'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminSignUpModel.fromJson(String source) => AdminSignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdminAuthModel(name: $name, email: $email, phoneNo: $phoneNo, password: $password)';
  }

  @override
  bool operator ==(covariant AdminSignUpModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.phoneNo == phoneNo &&
      other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      phoneNo.hashCode ^
      password.hashCode;
  }
}
