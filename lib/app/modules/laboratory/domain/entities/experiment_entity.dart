// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';

class Experiment {
  Experiment(
      {required this.name,
      required this.description,
      required this.laboratory});
  final String name;
  final String description;
  final Laboratory laboratory;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'laboratory': laboratory.toMap(),
    };
  }

  factory Experiment.fromMap(Map<String, dynamic> map) {
    return Experiment(
      name: map['name'] as String,
      description: map['description'] as String,
      laboratory: Laboratory.fromMap(map['laboratory'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Experiment.fromJson(String source) =>
      Experiment.fromMap(json.decode(source) as Map<String, dynamic>);
}
