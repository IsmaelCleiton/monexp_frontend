import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IGetExperimentsUsecase {
  Future<Either<AppFailure, List<Experiment>>> call(int laboratory);
}

class GetExperimentsUsecase implements IGetExperimentsUsecase {
  GetExperimentsUsecase(this._repository);
  final RemoteRepository _repository;
  @override
  Future<Either<AppFailure, List<Experiment>>> call(int laboratory) async {
    try {
      var response = await _repository.getExperiments(laboratory);
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
