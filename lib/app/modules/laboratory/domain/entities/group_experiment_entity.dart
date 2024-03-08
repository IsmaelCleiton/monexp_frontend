// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';

class ExperimentGroup {
  ExperimentGroup({
    required this.id,
    required this.name,
    required this.description,
      required this.experiment,
      required this.animalDataFields
  });

  final int id;
  final String name;
  final String description;
  final Experiment experiment;
  final String? animalDataFields;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'experiment': experiment.toMap(),
      'animal_data_fields': animalDataFields,
    };
  }

  factory ExperimentGroup.fromMap(Map<String, dynamic> map) {
    return ExperimentGroup(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      experiment: Experiment.fromMap(map['experiment'] as Map<String, dynamic>),
      animalDataFields: map['animal_data_fields'] != null
          ? map['animal_data_fields'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperimentGroup.fromJson(String source) =>
      ExperimentGroup.fromMap(json.decode(source) as Map<String, dynamic>);
}
