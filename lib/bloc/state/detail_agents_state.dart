import 'package:valorant_wiki/data/models/agent_model.dart';

abstract class DetailAgentsState {}

class LoadingDetailAgentsState extends DetailAgentsState {}

class LoadedDetailAgentsState extends DetailAgentsState {
  final AgentModel agentDetail;

  LoadedDetailAgentsState({required this.agentDetail});
}

class DetailAgentsErrorsState extends DetailAgentsState {
  final String errors;
  DetailAgentsErrorsState(this.errors);
}
