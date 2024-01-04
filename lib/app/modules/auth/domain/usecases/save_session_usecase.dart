import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/auth/infra/repositories/session_repository.dart';

abstract class ISaveSessionUsecase {
  bool call(Session session);
}

class SaveSessionUsecase implements ISaveSessionUsecase {
  SaveSessionUsecase(this._repository);
  final SessionRepository _repository;
  @override
  bool call(Session session) {
    try {
      return _repository.saveSession(session);
    } on Exception {
      return false;
    }
  }
}
