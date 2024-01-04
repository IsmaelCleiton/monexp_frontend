import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IGetLaboratoriesUsecase {
  Future<Either<AppFailure, List<Laboratory>>> call();
}

class GetLaboratoriesUsecase implements IGetLaboratoriesUsecase {
  GetLaboratoriesUsecase(this._repository);
  final RemoteRepository _repository;
  @override
  Future<Either<AppFailure, List<Laboratory>>> call() async {
    try {
      var response = await _repository.getLaboratories();
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
