import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/authentication_entity.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/user_entity.dart';
import 'package:monexp_frontend/app/modules/auth/domain/failures/login_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/failures/register_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/login_user_params.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/register_user_params.dart';
import 'package:monexp_frontend/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:monexp_frontend/app/modules/auth/external/datasources/auth_datasource.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._authDataSource);
  final AuthDataSource _authDataSource;

  @override
  Future<Either<LoginFailure, Authentication>> login(
      LoginUserParams params) async {
    var response = await _authDataSource.login(params);
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

  @override
  Future<Either<RegisterFailure, bool>> register(
      RegisterUserParams params) async {
    var response = await _authDataSource.register(params);
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

  @override
  Future<Either<AppFailure, User>> getUser(String token) async {
    var response = await _authDataSource.getUser(token);
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
