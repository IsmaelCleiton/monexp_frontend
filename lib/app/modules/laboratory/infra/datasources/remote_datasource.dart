import 'package:dartz/dartz.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/animal_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/animal_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_group_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/experiment_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/laboratory_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';

abstract class IRemoteDataSource {
  Future<Either<AppFailure, List<Laboratory>>> getLaboratories();
  Future<Either<AppFailure, List<Experiment>>> getExperiments(int laboratory);
  Future<Either<AppFailure, List<ExperimentGroup>>> getExperimentsGroups(
      int experiment);
  Future<Either<AppFailure, List<Animal>>> getAnimals(int experimentGroup);
  Future<Either<AppFailure, bool>> createLaboratories(
      LaboratoryParams laboratory);
  Future<Either<AppFailure, bool>> deleteLaboratory(int id);
  Future<Either<AppFailure, bool>> createExperiment(
      ExperimentParams experiment);
  Future<Either<AppFailure, bool>> deleteExperiment(int id);
  Future<Either<AppFailure, bool>> createExperimentGroup(
      ExperimentGroupParams experimentGroup);
  Future<Either<AppFailure, bool>> deleteExperimentGroup(int id);
  Future<Either<AppFailure, bool>> createAnimal(AnimalParams animal);
  Future<Either<AppFailure, bool>> deleteAnimal(int id);
}
