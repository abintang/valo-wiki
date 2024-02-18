abstract class AgentsEvent {
  const AgentsEvent();
}

class LoadAgentsEvent extends AgentsEvent {}

class LoadMoreAgents extends AgentsEvent {
  final int startIndex;
  final int count;

  const LoadMoreAgents({required this.startIndex, required this.count});
}
