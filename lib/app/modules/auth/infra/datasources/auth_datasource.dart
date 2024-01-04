import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/authentication_entity.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/user_entity.dart';
import 'package:monexp_frontend/app/modules/auth/domain/failures/login_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/failures/register_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/login_user_params.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/register_user_params.dart';

abstract class IAuthDataSource {
  Future<Either<LoginFailure, Authentication>> login(LoginUserParams params);
  Future<Either<RegisterFailure, bool>> register(RegisterUserParams params);
  Future<Either<AppFailure, User>> getUser(String token);
}
