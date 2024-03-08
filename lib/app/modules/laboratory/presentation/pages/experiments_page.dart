import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/core/shared/widgets/error_alert.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/experiments_page_store.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/states/experiment_page_state.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/add_experiment_dialog/add_experiment_dialog.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/update_experiment_dialog/update_experiment_dialog_ctrl.dart';

class ExperimentsPage extends StatefulWidget {
  const ExperimentsPage(
      {super.key, required this.store, required this.laboratory});
  final ExperimentsPageStore store;
  final Laboratory laboratory;
  @override
  State<ExperimentsPage> createState() => _ExperimentsPageState();
}

class _ExperimentsPageState extends State<ExperimentsPage> {
  @override
  void initState() {
    widget.store.setLaboratory(widget.laboratory);
    widget.store.getExperiments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experimentos'),
        elevation: 3,
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AddExperimentDialog(
                  onSave: widget.store.saveExperiment,
                  laboratoryId: widget.laboratory.id));
        },
        icon: const Icon(Icons.add),
      ),
      body: ScopedBuilder<ExperimentsPageStore, ExperimentPageState>(
          store: widget.store,
          onLoading: (context) =>
              const Center(child: CircularProgressIndicator()),
          onState: (context, state) => ListView.builder(
                itemCount: state.experiments?.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      Modular.to.pushNamed('/lab/experimentgroups',
                          arguments: state.experiments!.elementAt(index));
                    },
                    child: ListTile(
                      title: Text(state.experiments!.elementAt(index).name),
                      subtitle: Text(
                          state.experiments!.elementAt(index).laboratory.name),
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
                              var result = await widget.store.deleteExperiment(
                                  state.experiments!.elementAt(index).id);
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
                                builder: (context) => UpdateExperimentDialog(
                                    experiment:
                                        state.experiments!.elementAt(index),
                                    onUpdate: widget.store.updateExperiment),
                              );
                              break;
                            default:
                          }
                        },
                      ),
                    ),
                  );
                },
              )),
    );
  }
}
