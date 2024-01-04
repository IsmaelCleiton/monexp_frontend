import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IGetExperimentGroupsUsecase {
  Future<Either<AppFailure, List<ExperimentGroup>>> call(int experiment);
}

class GetExperimentGroupsUsecase implements IGetExperimentGroupsUsecase {
  final RemoteRepository _repository;

  GetExperimentGroupsUsecase(this._repository);
  @override
  Future<Either<AppFailure, List<ExperimentGroup>>> call(int experiment) async {
    try {
      var response = await _repository.getExperimentsGroups(experiment);
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
