import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_params.dart';

class AddExperimentDialogController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final int laboratoryId;

  AddExperimentDialogController({required this.laboratoryId});

  ExperimentParams generateExperiment() {
    return ExperimentParams(
        name: nameController.text,
        description: descriptionController.text,
        laboratory: laboratoryId);
  }
}
