import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IUpdateExperimentGroupUsecase {
  Future<Either<AppFailure, bool>> call(
      int id, ExperimentGroupParams experiment);
}

class UpdateExperimentGroupUsecase implements IUpdateExperimentGroupUsecase {
  UpdateExperimentGroupUsecase(this._repository);
  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(
      int id, ExperimentGroupParams experimentGroup) async {
    try {
      var response =
          await _repository.updateExperimentGroup(experimentGroup, id);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isLeft()) return Left(result);
      return right(result);
    } on Exception {
      rethrow;
    }
  }
}
