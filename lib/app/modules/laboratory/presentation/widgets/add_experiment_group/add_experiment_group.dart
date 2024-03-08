import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';

class AddExperimentGroupDialogController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final Experiment experiment;

  AddExperimentGroupDialogController({required this.experiment});

  ExperimentGroupParams generateExperimentGroup() {
    return ExperimentGroupParams(
      name: nameController.text,
      description: descriptionController.text,
      experiment: experiment.id,
    );
  }
}
