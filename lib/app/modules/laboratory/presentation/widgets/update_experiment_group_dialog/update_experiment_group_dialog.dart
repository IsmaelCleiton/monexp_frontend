import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/update_experiment_group_dialog/update_exeriment_group_dialog_ctrl.dart';

class UpdateExperimentGroupDialog extends StatefulWidget {
  UpdateExperimentGroupDialog(
      {super.key, required this.experiment, required this.onUpdate}) {
    controller =
        UpdateExperimentGroupDialogController(experimentGroup: experiment);
  }
  final ExperimentGroup experiment;
  late final UpdateExperimentGroupDialogController controller;
  final Function(ExperimentGroupParams, int) onUpdate;

  @override
  State<UpdateExperimentGroupDialog> createState() =>
      _UpdateExperimentGroupDialogState();
}

class _UpdateExperimentGroupDialogState
    extends State<UpdateExperimentGroupDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              flex: 8,
              child: Text(
                'Edite o Grupo de experimento',
                softWrap: true,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onUpdate(widget.controller.generateExperimentGroup(),
                widget.experiment.id);
            Navigator.pop(context);
          },
          child: const Text('Salvar'),
        ),
      ],
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: widget.controller.nameController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                  TextFormField(
                    controller: widget.controller.descriptionController,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
