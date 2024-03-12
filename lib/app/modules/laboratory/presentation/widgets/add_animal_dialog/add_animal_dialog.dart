import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/animal_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/add_animal_dialog/add_animal_dialog_ctrl.dart';

class AddAnimalDialog extends StatefulWidget {
  AddAnimalDialog(
      {super.key, required this.onSave, required int experimentGroupId}) {
    controller =
        AddAnimalDialogController(experimentGroupId: experimentGroupId);
  }
  late final AddAnimalDialogController controller;
  final Function(AnimalParams) onSave;
  @override
  State<AddAnimalDialog> createState() => _AddAnimalDialogState();
}

class _AddAnimalDialogState extends State<AddAnimalDialog> {
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
                'Adicione o novo animal',
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
            widget.onSave(widget.controller.generateAnimal());
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
                    controller: widget.controller.identificationController,
                    decoration:
                        const InputDecoration(labelText: 'Identificação'),
                  ),
                  TextFormField(
                    controller: widget.controller.specieController,
                    decoration: const InputDecoration(labelText: 'Espécie'),
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
