// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  User({
    required this.username,
    required this.email,
    required this.role,
    required this.accessLevel,
  });
  final String username;
  final String email;
  final String role;
  final int accessLevel;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'role': role,
      'accessLevel': accessLevel,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
      accessLevel: map['accessLevel'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
