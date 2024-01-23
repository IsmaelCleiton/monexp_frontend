import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IUpdateExperimentUsecase {
  Future<Either<AppFailure, bool>> call(int id, ExperimentParams experiment);
}

class UpdateExperimentUsecase implements IUpdateExperimentUsecase {
  UpdateExperimentUsecase(this._repository);
  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(
      int id, ExperimentParams experiment) async {
    try {
      var response = await _repository.updateExperiment(experiment, id);
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
