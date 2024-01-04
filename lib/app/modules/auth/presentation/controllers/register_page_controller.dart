import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/register_user_params.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/stores/register_page_store.dart';

class RegisterPageController {
  RegisterPageController(this.store) {
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  final RegisterPageStore store;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  late final TextEditingController emailController;

  Future<void> register() async {
    store.register(RegisterUserParams(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text));
    if (store.state) {
      Modular.to.navigate('/');
    }
  }
}
