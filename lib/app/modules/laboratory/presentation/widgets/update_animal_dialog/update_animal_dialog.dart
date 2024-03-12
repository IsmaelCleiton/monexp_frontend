import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/animal_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/animal_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/update_animal_dialog/update_animal_dialog_ctrl.dart';

class UpdateAnimalDialog extends StatefulWidget {
  UpdateAnimalDialog(
      {super.key, required this.animal, required this.onUpdate}) {
    controller = UpdateAnimalDialogController(animal: animal);
  }
  final Animal animal;
  late final UpdateAnimalDialogController controller;
  final Function(AnimalParams, int) onUpdate;

  @override
  State<UpdateAnimalDialog> createState() => _UpdateAnimalDialogState();
}

class _UpdateAnimalDialogState extends State<UpdateAnimalDialog> {
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
                'Edite o Animal',
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
                widget.controller.generateAnimal(), widget.animal.id);
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
                    controller: widget.controller.identificationController,
                    decoration:
                        const InputDecoration(labelText: 'identification'),
                  ),
                  TextFormField(
                    controller: widget.controller.specieController,
                    decoration: const InputDecoration(labelText: 'Espécie'),
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
