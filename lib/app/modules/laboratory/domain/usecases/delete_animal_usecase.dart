import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/remote_repository.dart';

abstract class IDeleteAnimalUsecase {
  Future<Either<AppFailure, bool>> call(int animal);
}

class DeleteAnimalUsecase implements IDeleteAnimalUsecase {
  DeleteAnimalUsecase(this._repository);

  final RemoteRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(int animal) async {
    try {
      var response = await _repository.deleteAnimal(animal);
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
