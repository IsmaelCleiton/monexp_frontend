import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class ICreateExperimentGroupUsecase {
  Future<Either<AppFailure, bool>> call(ExperimentGroupParams experimentGroup);
}

class CreateExperimentGroupUsecase implements ICreateExperimentGroupUsecase {
  CreateExperimentGroupUsecase(this._repository);

  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(
      ExperimentGroupParams experimentGroup) async {
    try {
      var response = await _repository.createExperimentGroup(experimentGroup);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }
}
