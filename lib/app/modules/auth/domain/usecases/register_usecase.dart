import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/modules/auth/domain/failures/register_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/register_user_params.dart';
import 'package:monexp_frontend/app/modules/auth/infra/repositories/auth_repository.dart';

abstract class IRegisterUsecase {
  Future<Either<RegisterFailure, bool>> call(RegisterUserParams params);
}

class RegisterUsecase implements IRegisterUsecase {
  RegisterUsecase(this._authRepository);
  final AuthRepository _authRepository;

  @override
  Future<Either<RegisterFailure, bool>> call(RegisterUserParams params) async {
    var response = await _authRepository.register(params);
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
