import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';
import 'package:monexp_frontend/app/modules/laboratory/laboratory_module.dart';

abstract class ICreateExperimentUsecase {
  Future<Either<AppFailure, bool>> call(ExperimentParams experiment);
}

class CreateExperimentUsecase implements ICreateExperimentUsecase {
  CreateExperimentUsecase(this._repository);

  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(ExperimentParams experiment) async {
    try {
      var response = await _repository.createExperiment(experiment);
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
