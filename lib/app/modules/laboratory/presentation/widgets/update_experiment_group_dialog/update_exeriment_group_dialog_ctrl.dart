import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';

class UpdateExperimentGroupDialogController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ExperimentGroup experimentGroup;

  UpdateExperimentGroupDialogController({required this.experimentGroup}) {
    nameController.text = experimentGroup.name;
    descriptionController.text = experimentGroup.description;
  }

  ExperimentGroupParams generateExperimentGroup() {
    return ExperimentGroupParams(
        name: nameController.text,
        description: descriptionController.text,
        experiment: experimentGroup.experiment.id);
  }
}
