import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/create_experiment_group_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/delete_experiment_group_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_experiment_groups_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_session_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/update_experiment_group_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/states/experiment_groups_page_state.dart';

class ExperimentGroupsPageStore extends Store<ExperimentGroupsPageState> {
  ExperimentGroupsPageStore(
      this._getExperimentGroupsUsecase,
      this._createExperimentGroupUsecase,
      this._getSessionUsecase,
      this._deleteExperimentGroupUsecase,
      this._updateExperimentGroupUsecase)
      : super(ExperimentGroupsPageState());

  final GetExperimentGroupsUsecase _getExperimentGroupsUsecase;
  final CreateExperimentGroupUsecase _createExperimentGroupUsecase;
  final GetSessionUsecase _getSessionUsecase;
  final DeleteExperimentGroupUsecase _deleteExperimentGroupUsecase;
  final UpdateExperimentGroupUsecase _updateExperimentGroupUsecase;

  void setExperiment(Experiment experiment) {
    update(state.copyWith(experiment: experiment));
  }

  Future<dynamic> saveExperimentGroup(ExperimentGroupParams experiment) async {
    setLoading(true);
    try {
      var createResponse = await _createExperimentGroupUsecase(experiment);
      createResponse.fold((l) {
        setLoading(false);
        setError;
      }, (r) async {
        setLoading(false);
        await getExperimentGroups();
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

  Future<void> getExperimentGroups() async {
    setLoading(true);
    var sessionResponse = await _getSessionUsecase();
    sessionResponse.fold((l) {
      setLoading(false);
    }, (r) async {
      var experimentResponse =
          await _getExperimentGroupsUsecase(state.experiment!.id);
      experimentResponse.fold((l) => setError, (r) {
        update(state.copyWith(experimentGroups: r));
      });
      setLoading(false);
    });
  }

  Future<dynamic> deleteExperimentGroup(int experimentGroupId) async {
    setLoading(true);
    var deleteResponse = await _deleteExperimentGroupUsecase(experimentGroupId);
    deleteResponse.fold((l) {
      setLoading(false);
      setError;
    }, (r) async {
      setLoading(false);
      await getExperimentGroups();
    });
  }

  Future<dynamic> updateExperimentGroup(
      ExperimentGroupParams experimentGroup, int experimentGroupId) async {
    setLoading(true);
    var updateResponse =
        await _updateExperimentGroupUsecase(experimentGroupId, experimentGroup);
    updateResponse.fold((l) {
      setLoading(false);
      setError;
    }, (r) async {
      setLoading(false);
      await getExperimentGroups();
    });
  }
}
