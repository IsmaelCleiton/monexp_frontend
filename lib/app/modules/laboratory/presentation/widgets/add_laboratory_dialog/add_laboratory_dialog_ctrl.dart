import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';

class AddLaboratoryDialogController {
  AddLaboratoryDialogController();
  final TextEditingController nameController = TextEditingController();

  LaboratoryParams generateLaboratory() {
    return LaboratoryParams(name: nameController.text);
  }
}