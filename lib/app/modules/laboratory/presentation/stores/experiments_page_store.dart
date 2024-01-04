import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_experiments_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_laboratories_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_session_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/states/experiment_page_state.dart';

class ExperimentsPageStore extends Store<ExperimentPageState> {
  ExperimentsPageStore(this._getExperimentsUsecase, this._getSessionUsecase)
      : super(ExperimentPageState());

  final GetExperimentsUsecase _getExperimentsUsecase;
  final GetSessionUsecase _getSessionUsecase;

  void setLaboratory(Laboratory laboratory) {
    update(state.copyWith(laboratory: laboratory));
  }

  Future<void> getExperiments() async {
    setLoading(true);
    var sessionResponse = await _getSessionUsecase.call();
    sessionResponse.fold((l) => setError, (r) async {
      var experimentResponse =
          await _getExperimentsUsecase.call(state.laboratory!.id);
      experimentResponse.fold((l) => setError, (r) {
        update(state.copyWith(experiments: r));
      });
    });
    setLoading(false);
  }
}
