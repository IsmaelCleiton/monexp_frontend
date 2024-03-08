
import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/add_experiment_group/add_experiment_group.dart';

class AddExperimentGroupDialog extends StatefulWidget {
  AddExperimentGroupDialog(
      {super.key, required this.experiment, required this.onSave}) {
    controller = AddExperimentGroupDialogController(experiment: experiment);
  }

  final Function(ExperimentGroupParams) onSave;
  late final AddExperimentGroupDialogController controller;
  final Experiment experiment;

  @override
  State<AddExperimentGroupDialog> createState() =>
      _AddExperimentGroupDialogState();
}

class _AddExperimentGroupDialogState extends State<AddExperimentGroupDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(33),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              flex: 8,
              child: Text(
                'Adicione o novo Grupo de experimento',
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
            widget.onSave(widget.controller.generateExperimentGroup());
            Navigator.pop(context);
          },
          child: const Text('Criar'),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
