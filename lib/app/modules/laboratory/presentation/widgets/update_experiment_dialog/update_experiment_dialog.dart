import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_params.dart';

class UpdateExperimentDialogController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final Experiment experiment;

  UpdateExperimentDialogController({required this.experiment}) {
    nameController.text = experiment.name;
    descriptionController.text = experiment.description;
  }

  ExperimentParams generateExperiment() {
    return ExperimentParams(
        name: nameController.text,
        description: descriptionController.text,
        laboratory: experiment.laboratory.id);
  }
}
