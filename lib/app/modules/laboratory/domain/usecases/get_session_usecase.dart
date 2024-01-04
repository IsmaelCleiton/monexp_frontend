import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/repositories/session_repository.dart';

abstract class IGetSessionUsecase {
  Future<Either<AppFailure, Session>> call();
}

class GetSessionUsecase implements IGetSessionUsecase {
  GetSessionUsecase(this._repository);

  final SessionRepository _repository;
  @override
  Future<Either<AppFailure, Session>> call() async {
    var response = await _repository.getSession();
    dynamic result;

    response.fold((l) {
      result = l;
    }, (r) {
      result = r;
    });

    if (response.isRight()) {
      return right(result);
    } else {
      return left(result);
    }
  }
}
