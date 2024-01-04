import 'package:flutter_modular/flutter_modular.dart';
import 'package:monexp_frontend/app/app_module.dart';
import 'package:monexp_frontend/app/modules/auth/domain/usecases/get_user_usecase.dart';
import 'package:monexp_frontend/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:monexp_frontend/app/modules/auth/domain/usecases/register_usecase.dart';
import 'package:monexp_frontend/app/modules/auth/domain/usecases/save_session_usecase.dart';
import 'package:monexp_frontend/app/modules/auth/external/datasources/auth_datasource.dart';
import 'package:monexp_frontend/app/modules/auth/infra/repositories/auth_repository.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/controllers/login_page.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/controllers/register_page_controller.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/pages/home_page.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/pages/login_page.dart';
import 'package:monexp_frontend/app/modules/auth/external/datasources/session_datasource.dart';
import 'package:monexp_frontend/app/modules/auth/infra/repositories/session_repository.dart';
import 'package:monexp_frontend/app/modules/laboratory/laboratory_module.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/pages/register_page.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/stores/login_page_store.dart';
import 'package:monexp_frontend/app/modules/auth/presentation/stores/register_page_store.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {
    // Services
    // Controllers
    i.add(LoginPageController.new);
    i.add(RegisterPageController.new);
    // Stores
    i.add(LoginPageStore.new);
    i.add(RegisterPageStore.new);
    // Repositories
    i.add(AuthRepository.new);
    i.add(SessionRepository.new);
    // DataSources
    i.add(AuthDataSource.new);
    i.add(SessionDataSource.new);
    // Usecases
    i.add(LoginUsecase.new);
    i.add(RegisterUsecase.new);
    i.add(GetUserUsecase.new);
    i.add(SaveSessionUsecase.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/login',
        child: (context) =>
            LoginPage(loginPageController: Modular.get<LoginPageController>()));
    r.child('/register',
        child: (context) =>
            RegisterPage(controller: Modular.get<RegisterPageController>()));
    r.module('/mainpage', module: LaboratoryModule());
  }
}
