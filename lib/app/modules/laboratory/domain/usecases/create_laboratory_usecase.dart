import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';
import 'package:monexp_frontend/app/modules/laboratory/laboratory_module.dart';

abstract class ICreateLaboratoryUsecase {
  Future<Either<AppFailure, bool>> call(LaboratoryParams laboratory);
}

class CreateLaboratoryUsecase implements ICreateLaboratoryUsecase {
  CreateLaboratoryUsecase(this._repository);

  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(LaboratoryParams laboratory) async {
    try {
      var response = await _repository.createLaboratories(laboratory);
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
