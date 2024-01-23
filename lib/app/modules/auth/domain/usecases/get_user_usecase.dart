import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/authentication_entity.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/user_entity.dart';
import 'package:monexp_frontend/app/modules/auth/infra/repositories/auth_repository.dart';

abstract class IGetUserUsecase {
  Future<Either<AppFailure, User>> call(Authentication authentication);
}

class GetUserUsecase implements IGetUserUsecase {
  GetUserUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<AppFailure, User>> call(Authentication authentication) async {
    var response = await _repository.getUser(authentication.token);
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
  }
}
