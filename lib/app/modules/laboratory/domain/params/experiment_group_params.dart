// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExperimentGroupParams {
  final String name;
  final String description;
  final int experiment;

  ExperimentGroupParams(
      {required this.name,
      required this.description,
      required this.experiment});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'experiment': experiment,
    };
  }

  factory ExperimentGroupParams.fromMap(Map<String, dynamic> map) {
    return ExperimentGroupParams(
      name: map['name'] as String,
      description: map['description'] as String,
      experiment: map['experiment'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperimentGroupParams.fromJson(String source) =>
      ExperimentGroupParams.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
