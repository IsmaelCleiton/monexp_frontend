// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LaboratoryParams {
  final String name;

  LaboratoryParams({required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory LaboratoryParams.fromMap(Map<String, dynamic> map) {
    return LaboratoryParams(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LaboratoryParams.fromJson(String source) =>
      LaboratoryParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
