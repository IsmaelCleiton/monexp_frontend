import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/modules/auth/domain/params/register_user_params.dart';
import 'package:monexp_frontend/app/modules/auth/domain/usecases/register_usecase.dart';

class RegisterPageStore extends Store<bool> {
  RegisterPageStore(this._registerUsecase) : super(false);

  final RegisterUsecase _registerUsecase;

  Future<void> register(RegisterUserParams params) async {
    setLoading(true);

    var result = await _registerUsecase.call(params);
    result.fold((l) => setError, (r) => update(true));

    setLoading(false);
  }
}
