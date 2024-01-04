// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Laboratory {
  Laboratory({required this.name, required this.id});
  final int id;
  final String name;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Laboratory.fromMap(Map<String, dynamic> map) {
    return Laboratory(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Laboratory.fromJson(String source) =>
      Laboratory.fromMap(json.decode(source) as Map<String, dynamic>);
}
