import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IDeleteLaboratoryUsecase {
  Future<Either<AppFailure, bool>> call(int laboratory);
}

class DeleteLaboratoryUsecase implements IDeleteLaboratoryUsecase {
  DeleteLaboratoryUsecase(this._repository);

  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(int laboratory) async {
    try {
      var response = await _repository.deleteLaboratory(laboratory);
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
      if (e is AppFailure) return left(e);
      rethrow;
    }
  }
}
