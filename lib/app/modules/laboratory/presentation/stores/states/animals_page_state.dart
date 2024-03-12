// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/animal_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';

class AnimalsPageState {
  AnimalsPageState({this.animals, this.experimentGroup});

  final List<Animal>? animals;
  final ExperimentGroup? experimentGroup;

  AnimalsPageState copyWith({
    List<Animal>? animals,
    ExperimentGroup? experimentGroup,
  }) {
    return AnimalsPageState(
      animals: animals ?? this.animals,
      experimentGroup: experimentGroup ?? this.experimentGroup,
    );
  }
}
