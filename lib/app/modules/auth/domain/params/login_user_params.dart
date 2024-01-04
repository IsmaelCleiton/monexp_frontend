// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginUserParams {
  LoginUserParams({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory LoginUserParams.fromMap(Map<String, dynamic> map) {
    return LoginUserParams(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserParams.fromJson(String source) =>
      LoginUserParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
