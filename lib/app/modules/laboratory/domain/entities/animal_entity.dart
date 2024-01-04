// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:monexp_frontend/app/modules/laboratory/domain/entities/animal_data_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';

class Animal {
  Animal({
    required this.identification,
    required this.species,
    required this.group,
  });
  final String species;
  final String identification;
  final ExperimentGroup group;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'species': species,
      'identification': identification,
      'group': group.toMap(),
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      species: map['species'] as String,
      identification: map['identification'] as String,
      group: ExperimentGroup.fromMap(map['group'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) =>
      Animal.fromMap(json.decode(source) as Map<String, dynamic>);
}
