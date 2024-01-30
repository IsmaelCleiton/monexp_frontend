import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/update_laboratory_dialog/update_laboratory_dialog_ctrl.dart';

class UpdateLaboratoryDialog extends StatefulWidget {
  UpdateLaboratoryDialog({super.key, required this.onSave});
  final void Function(LaboratoryParams) onSave;
  final UpdateLaboratoryDialogController controller =
      UpdateLaboratoryDialogController();
  @override
  State<UpdateLaboratoryDialog> createState() => _UpdateLaboratoryDialogState();
}

class _UpdateLaboratoryDialogState extends State<UpdateLaboratoryDialog> {
  @override
  Widget build(BuildContext context) {
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
                'Adicione o novo laboratório',
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
            widget.onSave(widget.controller.generateLaboratory());
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
