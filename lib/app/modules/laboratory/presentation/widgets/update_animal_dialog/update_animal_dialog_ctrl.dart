import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/animal_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/animal_params.dart';

class UpdateAnimalDialogController {
  final TextEditingController identificationController =
      TextEditingController();
  final TextEditingController specieController = TextEditingController();
  final Animal animal;

  UpdateAnimalDialogController({required this.animal}) {
    identificationController.text = animal.identification;
    specieController.text = animal.specie;
  }

  AnimalParams generateAnimal() {
    return AnimalParams(
        identification: identificationController.text,
        specie: identificationController.text,
        experimentGroup: animal.id);
  }
}
