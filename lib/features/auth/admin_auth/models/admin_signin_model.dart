// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdminSigninModel {
  String email;
  String password;
  AdminSigninModel({
    required this.email,
    required this.password,
  });

  AdminSigninModel copyWith({
    String? email,
    String? password,
  }) {
    return AdminSigninModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory AdminSigninModel.fromMap(Map<String, dynamic> map) {
    return AdminSigninModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminSigninModel.fromJson(String source) =>
      AdminSigninModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AdminSigninModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant AdminSigninModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
