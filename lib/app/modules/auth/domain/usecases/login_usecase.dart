import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/authentication_entity.dart';
import 'package:monexp_frontend/app/modules/auth/domain/failures/login_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/login_user_params.dart';
import 'package:monexp_frontend/app/modules/auth/infra/repositories/auth_repository.dart';

abstract class ILoginUsecase {
  Future<Either<LoginFailure, Authentication>> call(LoginUserParams params);
}

class LoginUsecase implements ILoginUsecase {
  LoginUsecase(this._authRepository);

  final AuthRepository _authRepository;
  @override
  Future<Either<LoginFailure, Authentication>> call(
      LoginUserParams params) async {
    var response = await _authRepository.login(params);
    dynamic result;
    response.fold((l) {
      result = l;
    }, (r) {
      result = r;
    });

    if (response.isLeft()) {
      return left(result);
    } else {
      return right(result);
    }
  }
}
