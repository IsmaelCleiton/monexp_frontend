// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';

class Animal {
  Animal({
    required this.id,
    required this.identification,
    required this.specie,
    required this.group,
  });
  final int id;
  final String specie;
  final String identification;
  final ExperimentGroup group;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'species': specie,
      'identification': identification,
      'group': group.toMap(),
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map['id'] as int,
      specie: map['species'] as String,
      identification: map['identification'] as String,
      group: ExperimentGroup.fromMap(map['group'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) =>
      Animal.fromMap(json.decode(source) as Map<String, dynamic>);
}
