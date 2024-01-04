import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/repositories/session_repository.dart';
import 'package:monexp_frontend/app/modules/laboratory/external/datasources/session_datasource.dart';

class SessionRepository implements ISessionRepository {
  SessionRepository(this._dataSource);

  final SessionDataSource _dataSource;

  @override
  Future<Either<AppFailure, Session>> getSession() async {
    var response = await _dataSource.getSession();
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
