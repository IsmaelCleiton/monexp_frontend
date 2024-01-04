import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/auth/domain/entities/authentication_entity.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/login_user_params.dart';
import 'package:monexp_frontend/app/modules/auth/domain/usecases/get_user_usecase.dart';
import 'package:monexp_frontend/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:monexp_frontend/app/modules/auth/domain/usecases/save_session_usecase.dart';

class LoginPageStore extends Store<Session?> {
  LoginPageStore(
    this._loginUsecase,
    this._getUserUsecase,
    this._saveSessionUsecase,
  ) : super(null);
  final LoginUsecase _loginUsecase;
  final GetUserUsecase _getUserUsecase;
  final SaveSessionUsecase _saveSessionUsecase;

  bool get isSuccess => state != null;

  send(LoginUserParams params) async {
    setLoading(true);
    var loginResult = await _loginUsecase.call(params);
    Session? session;
    late Authentication auth;

    loginResult.fold((l) => setError, (r) {
      auth = r;
    });
    if (loginResult.isRight()) {
      var getUserResult = await _getUserUsecase.call(auth);
      getUserResult.fold((l) {
        setError;
      }, (r) {
        Session sessionResult = Session(authentication: auth, user: r);
        session = sessionResult;
        var saveSessionResult = _saveSessionUsecase.call(sessionResult);
        print(saveSessionResult);
        print(sessionResult.user.toMap());
        if (!saveSessionResult) {
          setError;
        }
      });
    }

    update(session);
    setLoading(false);
    return session;
  }
}
