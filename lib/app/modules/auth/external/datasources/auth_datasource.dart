import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/core/shared/services/api_client_service.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/authentication_entity.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/user_entity.dart';
import 'package:monexp_frontend/app/modules/auth/domain/failures/login_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/failures/register_failure.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/login_user_params.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/register_user_params.dart';
import 'package:monexp_frontend/app/modules/auth/infra/datasources/auth_datasource.dart';

class AuthDataSource implements IAuthDataSource {
  AuthDataSource(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<Either<LoginFailure, Authentication>> login(
      LoginUserParams params) async {
    try {
      Response response = await _apiClient.login(params.toMap());

      if (response.statusCode == 200) {
        return right(Authentication(response.data['token']));
      }
      return left(LoginFailure(''));
    } on Exception {
      throw LoginFailure('');
    }
  }

  @override
  Future<Either<RegisterFailure, bool>> register(
      RegisterUserParams params) async {
    try {
      Response response = await _apiClient.registerUser(params.toMap());
      if (response.statusCode == 201) {
        return right(true);
      }
      return left(
        RegisterFailure(''),
      );
    } on Exception {
      throw RegisterFailure('');
    }
  }

  @override
  Future<Either<AppFailure, User>> getUser(String token) async {
    try {
      Response response = await _apiClient.getUser(token);
      if (response.statusCode == 200) {
        return right(User.fromMap(response.data));
      }
      return left(AppFailure('getUser error'));
    } on Exception {
      throw RegisterFailure('');
    }
  }
}
