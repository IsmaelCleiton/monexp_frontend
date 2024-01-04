import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/auth/domain/repositories/session_repository.dart';
import 'package:monexp_frontend/app/modules/auth/external/datasources/session_datasource.dart';

class SessionRepository implements ISessionRepository {
  SessionRepository(this._dataSource);
  final SessionDataSource _dataSource;
  @override
  bool saveSession(Session session) {
    try {
      return _dataSource.saveSession(session);
    } on Exception {
      rethrow;
    }
  }
}
