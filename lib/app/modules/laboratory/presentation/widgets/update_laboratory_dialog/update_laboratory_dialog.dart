import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/update_laboratory_dialog/update_laboratory_dialog_ctrl.dart';

class UpdateLaboratoryDialog extends StatefulWidget {
  UpdateLaboratoryDialog(
      {super.key, required this.onUpdate, required this.laboratory});
  final Laboratory laboratory;
  final void Function(
    LaboratoryParams,
    int,
  ) onUpdate;
  final UpdateLaboratoryDialogController controller =
      UpdateLaboratoryDialogController();
  @override
  State<UpdateLaboratoryDialog> createState() => _UpdateLaboratoryDialogState();
}

class _UpdateLaboratoryDialogState extends State<UpdateLaboratoryDialog> {
  @override
  Widget build(BuildContext context) {
    widget.controller.nameController.text = widget.laboratory.name;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(32),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              flex: 8,
              child: Text(
                'Edite o laboratório',
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
                widget.controller.generateLaboratory(), widget.laboratory.id);
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
