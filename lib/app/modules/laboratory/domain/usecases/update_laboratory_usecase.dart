import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IUpdateLaboratoryUsecase {
  Future<Either<AppFailure, bool>> call(
      int id, LaboratoryParams laboratoryParams);
}

class UpdateLaboratoryUsecase implements IUpdateLaboratoryUsecase {
  UpdateLaboratoryUsecase(this._repository);
  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(
      int id, LaboratoryParams laboratory) async {
    try {
      var response = await _repository.updateLaboratory(laboratory, id);
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
