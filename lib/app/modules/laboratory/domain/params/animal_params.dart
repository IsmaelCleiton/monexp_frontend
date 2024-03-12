// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AnimalParams {
  final String identification;
  final String specie;
  final int experimentGroup;

  AnimalParams(
      {required this.identification,
      required this.specie,
      required this.experimentGroup});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identification': identification,
      'species': specie,
      'group': experimentGroup,
    };
  }

  factory AnimalParams.fromMap(Map<String, dynamic> map) {
    return AnimalParams(
      identification: map['identification'] as String,
      specie: map['species'] as String,
      experimentGroup: map['group'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalParams.fromJson(String source) =>
      AnimalParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
