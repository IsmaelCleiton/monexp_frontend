import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/core/shared/services/api_client_service.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/animal_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/animal_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/infra/datasources/remote_datasource.dart';

class RemoteDataSource implements IRemoteDataSource {
  RemoteDataSource(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<Either<AppFailure, List<Laboratory>>> getLaboratories() async {
    try {
      Response response = await _apiClient.getLaboratories();
      List<Laboratory> list = [];
      if (response.statusCode == 200) {
        response.data.forEach(
          (element) {
            list.add(Laboratory.fromMap(element));
          },
        );
        return right(list);
      }
      return left(AppFailure('get Laboratories error'));
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, List<Experiment>>> getExperiments(
      int laboratory) async {
    try {
      Response response = await _apiClient.getExperiments(laboratory);
      List<Experiment> list = [];
      if (response.statusCode == 200) {
        response.data.forEach(
          (element) {
            list.add(Experiment.fromMap(element));
          },
        );
        return right(list);
      }
      return left(AppFailure('get Laboratories error'));
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, List<Animal>>> getAnimals(
      int experimentGroup) async {
    try {
      Response response = await _apiClient.getExperiments(experimentGroup);
      List<Animal> list = [];
      if (response.statusCode == 200) {
        response.data.forEach(
          (element) {
            list.add(Animal.fromMap(element));
          },
        );
        return right(list);
      }
      return left(AppFailure('get Laboratories error'));
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, List<ExperimentGroup>>> getExperimentsGroups(
      int experiment) async {
    try {
      Response response = await _apiClient.getExperiments(experiment);
      List<ExperimentGroup> list = [];
      if (response.statusCode == 200) {
        response.data.forEach(
          (element) {
            list.add(ExperimentGroup.fromMap(element));
          },
        );
        return right(list);
      }
      return left(AppFailure('get Laboratories error'));
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> createLaboratories(
      LaboratoryParams laboratory) async {
    try {
      Response response =
          await _apiClient.createLaboratory(laboratory.toJson());
      if (response.statusCode == 201) {
        return right(true);
      }
      return left(AppFailure('save Laboratories error'));
    } on Exception {
      throw AppFailure('save Laboratories error');
    }
  }

  @override
  Future<Either<AppFailure, bool>> createAnimal(AnimalParams animal) async {
    try {
      Response response = await _apiClient.createAnimal(animal.toJson());
      if (response.statusCode == 201) {
        return right(true);
      }
      return left(AppFailure('save Animal error'));
    } on Exception {
      throw AppFailure('save Animal error');
    }
  }

  @override
  Future<Either<AppFailure, bool>> createExperiment(
      ExperimentParams experiment) async {
    try {
      Response response =
          await _apiClient.createExperiment(experiment.toJson());
      if (response.statusCode == 201) {
        return right(true);
      }
      return left(AppFailure('save Experiment error'));
    } on Exception {
      throw AppFailure('save Experiment error');
    }
  }

  @override
  Future<Either<AppFailure, bool>> createExperimentGroup(
      ExperimentGroupParams experimentGroup) async {
    try {
      Response response =
          await _apiClient.createExperimentGroup(experimentGroup.toJson());
      if (response.statusCode == 201) {
        return right(true);
      }
      return left(AppFailure('save experimentGroup error'));
    } on Exception {
      throw AppFailure('save experimentGroup error');
    }
  }

  @override
  Future<Either<AppFailure, bool>> deleteAnimal(int id) async {
    try {
      Response response = await _apiClient.deleteAnimal(id);
      if (response.statusCode == 204) {
        return right(true);
      }
      return left(AppFailure('delete Animal error'));
    } on Exception {
      throw AppFailure('delete Animal error');
    }
  }

  @override
  Future<Either<AppFailure, bool>> deleteExperiment(int id) async {
    try {
      Response response = await _apiClient.deleteExperiment(id);
      if (response.statusCode == 204) {
        return right(true);
      }
      return left(AppFailure('delete Experiment error'));
    } on Exception {
      throw AppFailure('delete Experiment error');
    }
  }

  @override
  Future<Either<AppFailure, bool>> deleteExperimentGroup(int id) async {
    try {
      Response response = await _apiClient.deleteLaboratory(id);
      if (response.statusCode == 204) {
        return right(true);
      }
      return left(AppFailure('delete ExperimentGroup error'));
    } on Exception {
      throw AppFailure('delete ExperimentGroup error');
    }
  }

  @override
  Future<Either<AppFailure, bool>> deleteLaboratory(int id) async {
    try {
      Response response = await _apiClient.deleteLaboratory(id);
      if (response.statusCode == 204) {
        return right(true);
      }
      return left(AppFailure('Erro ao deletar: ${response.statusCode}'));
    } on Exception catch (e) {
      if (e is AppFailure) return left(e);
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> updateAnimal(
      AnimalParams animal, int id) async {
    try {
      Response response = await _apiClient.updateAnimal(id, animal.toJson());
      if (response.statusCode == 200) {
        return right(true);
      }
      return left(
          AppFailure('Erro ao atualizar animal: ${response.statusCode}'));
    } on Exception catch (e) {
      if (e is AppFailure) return left(e);
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> updateExperiment(
      ExperimentParams experiment, int id) async {
    try {
      Response response =
          await _apiClient.updateExperiment(id, experiment.toJson());
      if (response.statusCode == 200) {
        return right(true);
      }
      return left(
          AppFailure('Erro ao atualizar experimento: ${response.statusCode}'));
    } on Exception catch (e) {
      if (e is AppFailure) return left(e);
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> updateExperimentGroup(
      ExperimentGroupParams experimentGroup, int id) async {
    try {
      Response response =
          await _apiClient.updateExperiment(id, experimentGroup.toJson());
      if (response.statusCode == 200) {
        return right(true);
      }
      return left(AppFailure(
          'Erro ao atualizar grupo de experimento: ${response.statusCode}'));
    } on Exception catch (e) {
      if (e is AppFailure) return left(e);
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> updateLaboratory(
      LaboratoryParams laboratory, int id) async {
    try {
      Response response =
          await _apiClient.updateLaboratory(id, laboratory.toJson());
      if (response.statusCode == 200) {
        return right(true);
      }
      return left(
          AppFailure('Erro ao atualizar laboratório: ${response.statusCode}'));
    } on Exception catch (e) {
      if (e is AppFailure) return left(e);
      rethrow;
    }
  }
}
