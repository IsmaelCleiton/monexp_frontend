import 'package:flutter_modular/flutter_modular.dart';
import 'package:monexp_frontend/app/app_module.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/create_laboratory_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_experiments_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_laboratories_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_session_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/external/datasources/remote_datasource.dart';
import 'package:monexp_frontend/app/modules/laboratory/external/datasources/session_datasource.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/session_repository.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/pages/experiments_page.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/pages/laboratories_page.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/experiments_page_store.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/laboratories_page_store.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/main_page_store.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/widgets/add_laboratory_dialog/add_laboratory_dialog_ctrl.dart';

import 'presentation/pages/main_page.dart';

class LaboratoryModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {
    // Services
    // Controllers
    // Stores
    i.add(MainPageStore.new);
    i.add(LaboratoriesPageStore.new);
    i.add(ExperimentsPageStore.new);
    // Repositories
    i.add(SessionRepository.new);
    i.add(RemoteRepository.new);
    // DataSources
    i.add(SessionDataSource.new);
    i.add(RemoteDataSource.new);
    // Usecases
    i.add(GetSessionUsecase.new);
    i.add(GetLaboratoriesUsecase.new);
    i.add(GetExperimentsUsecase.new);
    i.add(CreateLaboratoryUsecase.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => MainPage(
              store: Modular.get<MainPageStore>(),
            ));
    r.child('/laboratories',
        child: (context) => LaboratoriesPage(
              store: Modular.get<LaboratoriesPageStore>(),
            ));
    r.child(
      '/experiments',
      child: (context) => ExperimentsPage(
        store: Modular.get<ExperimentsPageStore>(),
        laboratory: r.args.data,
      ),
    );
  }
}
