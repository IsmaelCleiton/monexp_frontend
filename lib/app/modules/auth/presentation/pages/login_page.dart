import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/controllers/login_page.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/stores/login_page_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.loginPageController,
  });

  final LoginPageController loginPageController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: ScopedBuilder<LoginPageStore, Session?>(
        store: widget.loginPageController.store,
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
        onState: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'login'),
                  controller: widget.loginPageController.loginController,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  controller: widget.loginPageController.passwordController,
                  onEditingComplete: () {
                    widget.loginPageController.login();
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.loginPageController.login();
                  },
                  child: const Text('login'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
