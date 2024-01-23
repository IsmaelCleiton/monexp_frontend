import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/main_page_store.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.store});

  final MainPageStore store;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    widget.store.getSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    double cardHeight = (size.height - kToolbarHeight - 80) / 2;
    double cardWeight = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Monexp'),
      ),
      drawer: ScopedBuilder<MainPageStore, Session?>(
        store: widget.store,
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
        onState: (context, state) => Drawer(
          child: Column(children: [
            DrawerHeader(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.person),
                      Column(
                        children: [
                          Text('${state?.user.username}'),
                          const Text(
                            'Cargo/Função do usuário',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(185, 0, 0, 0),
                            ),
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const ListTile(
                    title: Text('Configurações'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Modular.to.navigate('/');
                  },
                  child: const ListTile(
                    title: Text(
                      'Sair',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      body: ScopedBuilder<MainPageStore, Session?>(
        store: widget.store,
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
        onState: (context, state) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(5, 5))
                      ]),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bem vindo,',
                              style: TextStyle(fontSize: 24),
                            ),
                            Text('${state?.user.username}'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  clipBehavior: Clip.hardEdge,
                  childAspectRatio: cardWeight / cardHeight,
                  children: [
                    Card(
                      clipBehavior: Clip.hardEdge,
                      semanticContainer: false,
                      color: Colors.white,
                      child: TextButton(
                        onPressed: () {},
                        child: const Center(
                          child: Text(
                            'Contador de células',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.hardEdge,
                      color: Colors.white,
                      child: TextButton(
                        onPressed: () {
                          Modular.to.pushNamed('laboratories');
                        },
                        child: const Center(
                          child: Text(
                            'Gerenciar Experimentos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
