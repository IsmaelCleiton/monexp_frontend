import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/datasources/session_datasource.dart';

class SessionDataSource implements ISessionDataSource {
  SessionDataSource(this._service);
  final SessionService _service;
  @override
  Future<Either<AppFailure, Session>> getSession() async {
    var session = _service.getSession();
    if (session != null) {
      return right(session);
    } else {
      return left(AppFailure('Session error'));
    }
  }
}
