import 'package:valorant_wiki/data/models/agent_model.dart';

abstract class AgentsState {}

class AgentsLoadingState extends AgentsState {}

class AgentsLoadedState extends AgentsState {
  final List<AgentModel> agents;
  final bool hasReachedMax;

  AgentsLoadedState({required this.agents, required this.hasReachedMax});

  AgentsLoadedState copyWith({
    List<AgentModel>? agents,
    bool? hasReachedMax,
  }) {
    return AgentsLoadedState(
      agents: agents ?? this.agents,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

class AgentsErrorState extends AgentsState {
  final String errors;
  AgentsErrorState(this.errors);
}
