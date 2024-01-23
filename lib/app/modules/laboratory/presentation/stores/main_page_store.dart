import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_session_usecase.dart';

class MainPageStore extends Store<Session?> {
  MainPageStore(this._getSessionUsecase) : super(null);
  final GetSessionUsecase _getSessionUsecase;
  
  Session? get isSuccess => state;

  Future<void> getSession() async {
    setLoading(true);
    var response = await _getSessionUsecase.call();

    response.fold((l) => throw l, (r) {
      update(r);
    });
    setLoading(false);
  }
}
