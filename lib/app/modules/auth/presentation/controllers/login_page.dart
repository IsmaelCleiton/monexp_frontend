import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/params.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/stores/login_page_store.dart';

class LoginPageController {
  LoginPageController(
    this.store,
  );

  final LoginPageStore store;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    await store.send(LoginUserParams(
      username: loginController.text,
      password: passwordController.text,
    ));
    if (store.isSuccess) {
      Modular.to.navigate('/mainpage');
    }
  }
}
