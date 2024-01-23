import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/auth/infra/datasources/session_datasource.dart';

class SessionDataSource implements ISessionDataSource {
  SessionDataSource(this._service);
  final SessionService _service;
  @override
  bool saveSession(Session session) {
    try {
      _service.setSession(session);
      return true;
    } on Exception {
      throw AppFailure('save session failed');
    }
  }
}
