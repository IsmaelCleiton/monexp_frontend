import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/animal_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class ICreateAnimalUsecase {
  Future<Either<AppFailure, bool>> call(AnimalParams animalParams);
}

class CreateAnimalUsecase implements ICreateAnimalUsecase {
  CreateAnimalUsecase(this._repository);

  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(AnimalParams animal) async {
    try {
      var response = await _repository.createAnimal(animal);
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
