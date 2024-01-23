import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/create_laboratory_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/delete_laboratory_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_laboratories_usecase.dart';

class LaboratoriesPageStore extends Store<List<Laboratory>> {
  LaboratoriesPageStore(this._getLaboratoriesUsecase,
      this._createLaboratoryUsecase, this._deleteLaboratoryUsecase)
      : super([]);

  final GetLaboratoriesUsecase _getLaboratoriesUsecase;
  final CreateLaboratoryUsecase _createLaboratoryUsecase;
  final DeleteLaboratoryUsecase _deleteLaboratoryUsecase;

  bool get isSuccess => state.isNotEmpty;

  Future<dynamic> getLaboratories() async {
    setLoading(true);
    try {
      final response = await _getLaboratoriesUsecase();
      response.fold((l) {
        setLoading(false);
      }, update);
    } on Exception catch (error) {
      if (error is AppFailure) {
        return error.message;
      }
      setLoading(false);
      return error.toString();
    } finally {
      setLoading(false);
    }
  }

  Future<dynamic> createLaboratory(LaboratoryParams laboratory) async {
    setLoading(true);
    try {
      final createResponse = await _createLaboratoryUsecase(laboratory);
      createResponse.fold((l) {
        setLoading(false);
      }, (r) async {
        final getResponse = await _getLaboratoriesUsecase();
        getResponse.fold((l) {
          setLoading(false);
        }, update);
      });
    } on Exception catch (error) {
      if (error is AppFailure) {
        return error.message;
      }
      setLoading(false);
      return error.toString();
    } finally {
      setLoading(false);
    }
  }

  Future<dynamic> deleteLaboratory(int laboratoryId) async {
    try {
      final deleteResponse = await _deleteLaboratoryUsecase(laboratoryId);
      dynamic result;
      deleteResponse.fold((l) {
        result = l.message;
        setLoading(false);
      }, (r) {});
      if (result != null) return result;

      final getResponse = await _getLaboratoriesUsecase();
      getResponse.fold((l) {
        result = l.message;
        setLoading(false);
      }, update);

      if (result != null) return result;
    } on Exception catch (error) {
      if (error is AppFailure) {
        return error.message;
      }
      setLoading(false);
      return error.toString();
    } finally {
      setLoading(false);
    }
  }
}
