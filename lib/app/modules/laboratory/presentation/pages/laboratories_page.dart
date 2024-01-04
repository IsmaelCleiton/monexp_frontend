import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/laboratories_page_store.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/add_laboratory_dialog/add_laboratory_dialog.dart';

class LaboratoriesPage extends StatefulWidget {
  const LaboratoriesPage({super.key, required this.store});
  final LaboratoriesPageStore store;
  @override
  State<LaboratoriesPage> createState() => _LaboratoriesPageState();
}

class _LaboratoriesPageState extends State<LaboratoriesPage> {
  @override
  void initState() {
    widget.store.getLaboratories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laboratórios'),
        elevation: 3,
      ),
      floatingActionButton:
          ScopedBuilder<LaboratoriesPageStore, List<Laboratory>>(
              store: widget.store,
              onState: (context, state) {
                return IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddLaboratoryDialog(
                          onSave: widget.store.createLaboratory),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 24,
                  ),
                );
              }),
      body: ScopedBuilder<LaboratoriesPageStore, List<Laboratory>>(
        store: widget.store,
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
        onState: (context, state) => ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                Modular.to.pushNamed('/lab/experiments',
                    arguments: state.elementAt(index));
              },
              child: ListTile(
                title: Text(state.elementAt(index).name),
                leading: const Icon(Icons.business_center),
                trailing: PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'excluir',
                      child: Text('Excluir'),
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 'excluir') {}
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