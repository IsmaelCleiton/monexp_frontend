// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExperimentParams {
  final String name;
  final String description;
  final int laboratory;

  ExperimentParams(
      {required this.name,
      required this.description,
      required this.laboratory});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'laboratory': laboratory,
    };
  }

  factory ExperimentParams.fromMap(Map<String, dynamic> map) {
    return ExperimentParams(
      name: map['name'] as String,
      description: map['description'] as String,
      laboratory: map['laboratory'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperimentParams.fromJson(String source) =>
      ExperimentParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
