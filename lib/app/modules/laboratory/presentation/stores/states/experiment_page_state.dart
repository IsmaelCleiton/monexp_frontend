// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/laboratory_entity.dart';

class ExperimentPageState {
  ExperimentPageState({
    this.laboratory,
    this.experiments,
  });

  final List<Experiment>? experiments;
  final Laboratory? laboratory;

  ExperimentPageState copyWith({
    List<Experiment>? experiments,
    Laboratory? laboratory,
  }) {
    return ExperimentPageState(
      experiments: experiments ?? this.experiments,
      laboratory: laboratory ?? this.laboratory,
    );
  }
}
