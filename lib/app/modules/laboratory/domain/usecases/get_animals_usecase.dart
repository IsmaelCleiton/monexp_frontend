import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/animal_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IGetAnimalsUsecase {
  Future<Either<AppFailure, List<Animal>>> call(int experiment);
}

class GetAnimalsUsecase implements IGetAnimalsUsecase {
  final RemoteRepository _repository;

  GetAnimalsUsecase(this._repository);
  @override
  Future<Either<AppFailure, List<Animal>>> call(
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
