import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/animal_params.dart';

class AddAnimalDialogController {
  final TextEditingController identificationController =
      TextEditingController();
  final TextEditingController specieController = TextEditingController();
  final int experimentGroupId;

  AddAnimalDialogController({required this.experimentGroupId});

  AnimalParams generateAnimal() {
    return AnimalParams(
        identification: identificationController.text,
        specie: specieController.text,
        experimentGroup: experimentGroupId);
  }
}
