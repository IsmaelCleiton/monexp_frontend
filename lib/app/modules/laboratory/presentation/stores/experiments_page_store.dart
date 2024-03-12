import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/create_experiment_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/delete_experiment_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_experiments_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_session_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/states/experiment_page_state.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/update_experiment_usecase.dart';

class ExperimentsPageStore extends Store<ExperimentPageState> {
  ExperimentsPageStore(
      this._getExperimentsUsecase,
      this._getSessionUsecase,
      this._createExperimentUsecase,
      this._deleteExperimentUsecase,
      this._updateExperimentUsecase)
      : super(ExperimentPageState());

  final GetExperimentsUsecase _getExperimentsUsecase;
  final CreateExperimentUsecase _createExperimentUsecase;
  final GetSessionUsecase _getSessionUsecase;
  final DeleteExperimentUsecase _deleteExperimentUsecase;
  final UpdateExperimentUsecase _updateExperimentUsecase;

  void setLaboratory(Laboratory laboratory) {
    update(state.copyWith(laboratory: laboratory));
  }

  Future<dynamic> saveExperiment(ExperimentParams experiment) async {
    setLoading(true);
    try {
      var createResponse = await _createExperimentUsecase(experiment);
      createResponse.fold((l) {
        setLoading(false);
        setError;
      }, (r) async {
        setLoading(false);
        await getExperiments();
      });
    } on Exception catch (error) {
      if (error is AppFailure) {
        setLoading(false);
        setError;
        return error.message;
      }
      setLoading(false);
      setError;
      return error.toString();
    } finally {
      setLoading(false);
    }
  }

  Future<void> getExperiments() async {
    setLoading(true);
    var sessionResponse = await _getSessionUsecase();
    sessionResponse.fold((l) {
      setLoading(false);
    }, (r) async {
      var experimentResponse =
          await _getExperimentsUsecase.call(state.laboratory!.id);
      experimentResponse.fold((l) => setError, (r) {
        update(state.copyWith(experiments: r));
      });
    });
    setLoading(false);
  }

  Future<dynamic> deleteExperiment(int experimentId) async {
    setLoading(true);
    var deleteResponse = await _deleteExperimentUsecase(experimentId);
    deleteResponse.fold((l) {
      setLoading(false);
      setError;
    }, (r) async {
      setLoading(false);
      await getExperiments();
    });
  }

  Future<dynamic> updateExperiment(
      ExperimentParams experiment, int experimentId) async {
    setLoading(true);
    var updateResponse =
        await _updateExperimentUsecase(experimentId, experiment);
    updateResponse.fold((l) {
      setLoading(false);
      setError;
    }, (r) async {
      setLoading(false);
      await getExperiments();
    });
  }
}
