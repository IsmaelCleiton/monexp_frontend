import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/add_experiment_dialog/add_experement_dialog_ctrl.dart';

class AddExperimentDialog extends StatefulWidget {
  AddExperimentDialog(
      {super.key, required this.onSave, required int laboratoryId}) {
    controller = AddExperimentDialogController(laboratoryId: laboratoryId);
  }
  final void Function(ExperimentParams) onSave;
  late final AddExperimentDialogController controller;
  @override
  State<AddExperimentDialog> createState() => _AddExperimentDialogState();
}

class _AddExperimentDialogState extends State<AddExperimentDialog> {
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
                'Adicione o novo Experimento',
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
            widget.onSave(widget.controller.generateExperiment());
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
