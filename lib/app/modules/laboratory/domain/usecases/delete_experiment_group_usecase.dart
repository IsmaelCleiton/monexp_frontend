import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IDeleteExperimentGroupUsecase {
  Future<Either<AppFailure, bool>> call(int experimentGroup);
}

class DeleteExperimentGroupUsecase implements IDeleteExperimentGroupUsecase {
  DeleteExperimentGroupUsecase(this._repository);

  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(int experimentGroup) async {
    try {
      var response = await _repository.deleteExperimentGroup(experimentGroup);
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
