import 'package:flutter/material.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/controllers/register_page_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.controller});

  final RegisterPageController controller;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                controller: widget.controller.usernameController,
                decoration: const InputDecoration(
                  labelText: 'Usuário',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: widget.controller.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: widget.controller.passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    widget.controller.register();
                  },
                  child: const Text('Registrar'))
            ],
          )),
        ),
      ),
    );
  }
}
