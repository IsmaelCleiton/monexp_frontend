// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterUserParams {
  RegisterUserParams({
    required this.username,
    required this.email,
    required this.password,
  });

  final String username;
  final String email;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory RegisterUserParams.fromMap(Map<String, dynamic> map) {
    return RegisterUserParams(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserParams.fromJson(String source) =>
      RegisterUserParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
