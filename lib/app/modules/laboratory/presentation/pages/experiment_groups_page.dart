import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/experiment_groups_page_store.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/states/experiment_groups_page_state.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/add_experiment_group/add_experiment_group_ctrl.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/update_experiment_group_dialog/update_experiment_group_dialog.dart';

import '../../../../core/shared/widgets/error_alert.dart';

class ExperimentGroupsPage extends StatefulWidget {
  const ExperimentGroupsPage(
      {super.key, required this.store, required this.experiment});
  final Experiment experiment;
  final ExperimentGroupsPageStore store;
  @override
  State<ExperimentGroupsPage> createState() => _ExperimentGroupsPageState();
}

class _ExperimentGroupsPageState extends State<ExperimentGroupsPage> {
  @override
  void initState() {
    widget.store.setExperiment(widget.experiment);
    widget.store.getExperimentGroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grupos do Experimento'),
        elevation: 3,
      ),
      floatingActionButton:
          ScopedBuilder<ExperimentGroupsPageStore, ExperimentGroupsPageState>(
              store: widget.store,
              onState: (context, state) {
                return IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddExperimentGroupDialog(
                        experiment: widget.experiment,
                        onSave: widget.store.saveExperimentGroup,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 24,
                  ),
                );
              }),
      body: ScopedBuilder<ExperimentGroupsPageStore, ExperimentGroupsPageState>(
        store: widget.store,
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
        onState: (context, state) => ListView.builder(
          itemCount: state.experimentGroups!.length,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                //Modular.to.pushNamed('/lab/experiments',
                //  arguments: state.experimentGroups!.elementAt(index));
              },
              child: ListTile(
                title: Text(state.experimentGroups!.elementAt(index).name),
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
                        var result = await widget.store.deleteExperimentGroup(
                            state.experimentGroups!.elementAt(index).id);
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
                          builder: (context) => UpdateExperimentGroupDialog(
                            experiment:
                                state.experimentGroups!.elementAt(index),
                            onUpdate: widget.store.updateExperimentGroup,
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
