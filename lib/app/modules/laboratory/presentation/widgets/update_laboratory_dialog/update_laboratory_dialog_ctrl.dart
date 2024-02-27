import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';

class UpdateLaboratoryDialogController {
  UpdateLaboratoryDialogController();
  final TextEditingController nameController = TextEditingController();

  LaboratoryParams generateLaboratory() {
    return LaboratoryParams(name: nameController.text);
  }
}
