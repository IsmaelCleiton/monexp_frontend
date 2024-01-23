import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/animal_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IUpdateAnimalUsecase {
  Future<Either<AppFailure, bool>> call(int id, AnimalParams animal);
}

class UpdateAnimalUsecase implements IUpdateAnimalUsecase {
  UpdateAnimalUsecase(this._repository);
  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(int id, AnimalParams animal) async {
    try {
      var response = await _repository.updateAnimal(animal, id);
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
