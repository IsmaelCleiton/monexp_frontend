// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:monexp_frontend/app/modules/laboratory/domain/entities/animal_entity.dart';

class ExperimentGroup {
  ExperimentGroup({
    required this.name,
    required this.description,
    required this.animal,
  });

  final String name;
  final String description;
  final Animal animal;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'animal': animal.toMap(),
    };
  }

  factory ExperimentGroup.fromMap(Map<String, dynamic> map) {
    return ExperimentGroup(
      name: map['name'] as String,
      description: map['description'] as String,
      animal: Animal.fromMap(map['animal'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperimentGroup.fromJson(String source) =>
      ExperimentGroup.fromMap(json.decode(source) as Map<String, dynamic>);
}
