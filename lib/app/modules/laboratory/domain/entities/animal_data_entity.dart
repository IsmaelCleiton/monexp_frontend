// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:monexp_frontend/app/modules/laboratory/domain/entities/animal_entity.dart';

class AnimalData {
  AnimalData({
    required this.size,
    required this.weight,
    required this.animal,
  });

  final double size;
  final double weight;
  final Animal animal;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'size': size,
      'weight': weight,
      'animal': animal.toMap(),
    };
  }

  factory AnimalData.fromMap(Map<String, dynamic> map) {
    return AnimalData(
      size: map['size'] as double,
      weight: map['weight'] as double,
      animal: Animal.fromMap(map['animal'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalData.fromJson(String source) =>
      AnimalData.fromMap(json.decode(source) as Map<String, dynamic>);
}
