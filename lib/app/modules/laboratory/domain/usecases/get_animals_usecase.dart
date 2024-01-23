import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IGetAnimals {
  Future<Either<AppFailure, List<ExperimentGroup>>> call(int experiment);
}

class GetAnimals implements IGetAnimals {
  final RemoteRepository _repository;

  GetAnimals(this._repository);
  @override
  Future<Either<AppFailure, List<ExperimentGroup>>> call(
      int experimentGroup) async {
    try {
      var response = await _repository.getAnimals(experimentGroup);
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
    } on Exception {
      rethrow;
    }
  }
}
