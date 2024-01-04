import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/core/shared/services/session_service.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/animal_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/animal_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/repositories/remote_repository.dart';
import 'package:monexp_frontend/app/modules/laboratory/external/datasources/remote_datasource.dart';

class RemoteRepository implements IRemoteRepository {
  RemoteRepository(this._dataSource);
  final RemoteDataSource _dataSource;
  @override
  Future<Either<AppFailure, List<Laboratory>>> getLaboratories() async {
    try {
      var response = await _dataSource.getLaboratories();
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, List<Experiment>>> getExperiments(
      int laboratory) async {
    try {
      var response = await _dataSource.getExperiments(laboratory);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> createLaboratories(
      LaboratoryParams laboratory) async {
    try {
      var response = await _dataSource.createLaboratories(laboratory);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> createAnimal(AnimalParams animal) async {
    try {
      var response = await _dataSource.createAnimal(animal);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> createExperiment(
      ExperimentParams experiment) async {
    try {
      var response = await _dataSource.createExperiment(experiment);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> createExperimentGroup(
      ExperimentGroupParams experimentGroup) async {
    try {
      var response = await _dataSource.createExperimentGroup(experimentGroup);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> deleteAnimal(int id) async {
    try {
      var response = await _dataSource.deleteAnimal(id);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> deleteExperiment(int id) async {
    try {
      var response = await _dataSource.deleteExperiment(id);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> deleteExperimentGroup(int id) async {
    try {
      var response = await _dataSource.deleteExperimentGroup(id);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, bool>> deleteLaboratory(int id) async {
    try {
      var response = await _dataSource.deleteLaboratory(id);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, List<Animal>>> getAnimals(
      int experimentGroup) async {
    try {
      var response = await _dataSource.getAnimals(experimentGroup);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<AppFailure, List<ExperimentGroup>>> getExperimentsGroups(
      int experiment) async {
    try {
      var response = await _dataSource.getExperimentsGroups(experiment);
      dynamic result;
      response.fold((l) {
        result = l;
      }, (r) {
        result = r;
      });
      if (response.isRight()) {
        return right(result);
      }
      return left(result);
    } on Exception catch (e) {
      rethrow;
    }
  }
}
