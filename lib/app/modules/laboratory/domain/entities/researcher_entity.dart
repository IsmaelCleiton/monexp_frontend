// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Researcher {
  Researcher({required this.email, required this.role, required this.username});

  final String username;
  final String role;
  final String email;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'role': role,
      'email': email,
    };
  }

  factory Researcher.fromMap(Map<String, dynamic> map) {
    return Researcher(
      username: map['username'] as String,
      role: map['role'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Researcher.fromJson(String source) =>
      Researcher.fromMap(json.decode(source) as Map<String, dynamic>);
}
