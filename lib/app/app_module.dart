import 'package:flutter_modular/flutter_modular.dart';
import 'package:monexp_frontend/app/core/shared/services/api_client_service.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/auth/auth_module.dart';
import 'package:monexp_frontend/app/modules/laboratory/laboratory_module.dart';

class AppModule extends Module {
  @override
  void exportedBinds(i) {
    // Services
    i.addSingleton(ApiClient.new);
    i.addSingleton(SessionService.new);
  }

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: AuthModule());
    r.module('/lab', module: LaboratoryModule());
  }
}
