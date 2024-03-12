import 'package:flutter_triple/flutter_triple.dart';
import 'package:monexp_frontend/app/core/interfaces/app_failure.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/params/animal_params.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/create_animal_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/delete_animal_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_animals_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/get_session_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/usecases/update_animal_usecase.dart';
import 'package:monexp_frontend/app/modules/laboratory/presentation/stores/states/animals_page_state.dart';

class AnimalsPageStore extends Store<AnimalsPageState> {
  AnimalsPageStore(
      this._getAnimalsUsecase,
      this._createAnimalUsecase,
      this._getSessionUsecase,
      this._deleteAnimalUsecase,
      this._updateAnimalUsecase)
      : super(AnimalsPageState());

  final GetAnimalsUsecase _getAnimalsUsecase;
  final CreateAnimalUsecase _createAnimalUsecase;
  final GetSessionUsecase _getSessionUsecase;
  final DeleteAnimalUsecase _deleteAnimalUsecase;
  final UpdateAnimalUsecase _updateAnimalUsecase;

  void setExperimentGroup(ExperimentGroup experimentGroup) {
    update(state.copyWith(experimentGroup: experimentGroup));
  }

  Future<dynamic> saveAnimal(AnimalParams animal) async {
    setLoading(true);
    try {
      var createResponse = await _createAnimalUsecase(animal);
      createResponse.fold((l) {
        setLoading(false);
        setError;
      }, (r) async {
        setLoading(false);
        await getAnimals();
      });
    } on Exception catch (error) {
      if (error is AppFailure) {
        setLoading(false);
        setError;
        return error.message;
      }
      setLoading(false);
      setError;
      return error.toString();
    } finally {
      setLoading(false);
    }
  }

  Future<void> getAnimals() async {
    setLoading(true);
    var sessionResponse = await _getSessionUsecase();
    sessionResponse.fold((l) {
      setLoading(false);
    }, (r) async {
      var animalsResponse = await _getAnimalsUsecase(state.experimentGroup!.id);
      animalsResponse.fold((l) => setError, (r) {
        update(state.copyWith(animals: r));
      });
      setLoading(false);
    });
  }

  Future<dynamic> deleteAnimal(int animalId) async {
    setLoading(true);
    var deleteResponse = await _deleteAnimalUsecase(animalId);
    deleteResponse.fold((l) {
      setLoading(false);
      setError;
    }, (r) async {
      setLoading(false);
      await getAnimals();
    });
  }

  Future<dynamic> updateAnimal(AnimalParams animal, int animalId) async {
    setLoading(true);
    var updateResponse = await _updateAnimalUsecase(animalId, animal);
    updateResponse.fold((l) {
      setLoading(false);
      setError;
    }, (r) async {
      setLoading(false);
      await getAnimals();
    });
  }
}
