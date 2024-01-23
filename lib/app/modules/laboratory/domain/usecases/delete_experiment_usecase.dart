import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IDeleteExperimentUsecase {
  Future<Either<AppFailure, bool>> call(int experiment);
}

class DeleteExperimentUsecase implements IDeleteExperimentUsecase {
  DeleteExperimentUsecase(this._repository);

  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(int experiment) async {
    try {
      var response = await _repository.deleteExperiment(experiment);
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
