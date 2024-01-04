import 'package:monexp_frontend/app/modules/auth/domain/entities/authentication_entity.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/user_entity.dart';

class Session {
  Session({
    required this.authentication,
    required this.user,
  });

  Authentication authentication;
  User user;
}

class SessionService {
  SessionService({Session? session}) {
    _session = session;
  }

  Session? _session;

  Session? getSession() {
    return _session;
  }

  void setSession(Session session) {
    _session = session;
  }
}
