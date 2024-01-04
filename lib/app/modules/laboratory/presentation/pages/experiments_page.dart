import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/experiments_page_store.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/states/experiment_page_state.dart';

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
        onPressed: () {},
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
                    onPressed: () {},
                    child: ListTile(
                      title: Text(state.experiments!.elementAt(index).name),
                      subtitle: Text(
                          state.experiments!.elementAt(index).laboratory.name),
                      leading: Icon(Icons.business_center),
                      // trailing: IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.arrow_drop_down),
                      // ),
                    ),
                  );
                },
              )),
    );
  }
}
