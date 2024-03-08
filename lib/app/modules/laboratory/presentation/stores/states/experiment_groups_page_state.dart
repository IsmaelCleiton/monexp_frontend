// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/experiment_entity.dart';
import 'package:monexp_frontend/app/modules/laboratory/domain/entities/group_experiment_entity.dart';

class ExperimentGroupsPageState {
  ExperimentGroupsPageState({this.experiment, this.experimentGroups});

  final List<ExperimentGroup>? experimentGroups;
  final Experiment? experiment;

  ExperimentGroupsPageState copyWith({
    List<ExperimentGroup>? experimentGroups,
    Experiment? experiment,
  }) {
    return ExperimentGroupsPageState(
      experiment: experiment ?? this.experiment,
      experimentGroups: experimentGroups ?? this.experimentGroups,
    );
  }
}
