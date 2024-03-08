import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/update_experiment_dialog/update_experiment_dialog.dart';

class UpdateExperimentDialog extends StatefulWidget {
  UpdateExperimentDialog(
      {super.key, required this.experiment, required this.onUpdate}) {
    controller = UpdateExperimentDialogController(experiment: experiment);
  }
  final Experiment experiment;
  late final UpdateExperimentDialogController controller;
  final Function(ExperimentParams, int) onUpdate;

  @override
  State<UpdateExperimentDialog> createState() => _UpdateExperimentDialogState();
}

class _UpdateExperimentDialogState extends State<UpdateExperimentDialog> {
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
                'Edite o experimento',
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
            widget.onUpdate(
                widget.controller.generateExperiment(), widget.experiment.id);
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

