import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Monexp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          applyElevationOverlayColor: true,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white,
            elevation: 10,
            shadowColor: Colors.black26,
          )),
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}
