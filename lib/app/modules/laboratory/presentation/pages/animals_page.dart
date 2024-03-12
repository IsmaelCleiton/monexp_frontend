import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/animals_page_store.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/states/animals_page_state.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/add_animal_dialog/add_animal_dialog.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/update_animal_dialog/update_animal_dialog.dart';
import '../../../../core/shared/widgets/error_alert.dart';

class AnimalsPage extends StatefulWidget {
  const AnimalsPage(
      {super.key, required this.store, required this.experimentGroup});
  final ExperimentGroup experimentGroup;
  final AnimalsPageStore store;
  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  @override
  void initState() {
    widget.store.setExperimentGroup(widget.experimentGroup);
    widget.store.getAnimals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animais do grupo ${widget.experimentGroup.name}'),
        elevation: 3,
      ),
      floatingActionButton: ScopedBuilder<AnimalsPageStore, AnimalsPageState>(
          store: widget.store,
          onState: (context, state) {
            return IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddAnimalDialog(
                    experimentGroupId: widget.experimentGroup.id,
                    onSave: widget.store.saveAnimal,
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                size: 24,
              ),
            );
          }),
      body: ScopedBuilder<AnimalsPageStore, AnimalsPageState>(
        store: widget.store,
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
        onState: (context, state) => ListView.builder(
          itemCount: state.animals!.length,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                //Modular.to.pushNamed('/lab/experiments',
                //  arguments: state.experimentGroups!.elementAt(index));
              },
              child: ListTile(
                title: Text(state.animals!.elementAt(index).identification),
                leading: const Icon(Icons.business_center),
                trailing: PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'editar',
                      child: Text('Editar'),
                    ),
                    const PopupMenuItem(
                      value: 'excluir',
                      child: Text('Excluir'),
                    ),
                  ],
                  onSelected: (value) async {
                    switch (value) {
                      case 'excluir':
                        var result = await widget.store
                            .deleteAnimal(state.animals!.elementAt(index).id);
                        if (result is String) {
                          if (!context.mounted) return;
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  ErrorAlert(message: result));
                        }
                        break;
                      case 'editar':
                        if (!context.mounted) return;
                        showDialog(
                          context: context,
                          builder: (context) => UpdateAnimalDialog(
                            animal: state.animals!.elementAt(index),
                            onUpdate: widget.store.updateAnimal,
                          ),
                        );
                        break;
                      default:
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
