import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/create_laboratory_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_laboratories_usecase.dart';

class LaboratoriesPageStore extends Store<List<Laboratory>> {
  LaboratoriesPageStore(
      this._getLaboratoriesUsecase, this._createLaboratoryUsecase)
      : super([]);

  final GetLaboratoriesUsecase _getLaboratoriesUsecase;
  final CreateLaboratoryUsecase _createLaboratoryUsecase;

  bool get isSuccess => state.isNotEmpty;

  Future<void> getLaboratories() async {
    setLoading(true);
    try {
      final response = await _getLaboratoriesUsecase();
      response.fold(setError, update);
    } catch (error) {
      setError(error);
    } finally {
      setLoading(false);
    }
  }

  Future<void> createLaboratory(LaboratoryParams laboratory) async {
    setLoading(true);
    try {
      final createResponse = await _createLaboratoryUsecase(laboratory);
      createResponse.fold(setError, (r) async {
        final getResponse = await _getLaboratoriesUsecase();
        getResponse.fold(setError, update);
      });
    } catch (error) {
      setError(error);
    } finally {
      setLoading(false);
    }
  }
}
