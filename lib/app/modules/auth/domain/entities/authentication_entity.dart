// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Authentication {
  Authentication(this.token);

  final String token;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory Authentication.fromMap(Map<String, dynamic> map) {
    return Authentication(
      map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Authentication.fromJson(String source) =>
      Authentication.fromMap(json.decode(source) as Map<String, dynamic>);
}
