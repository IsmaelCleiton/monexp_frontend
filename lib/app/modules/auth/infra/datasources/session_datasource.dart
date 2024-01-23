import 'package:monexp_frontend/app/core/shared/services/session_service.dart';

abstract class ISessionDataSource {
  bool saveSession(Session session);
}
