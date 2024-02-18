abstract class DetailAgentsEvent {
  const DetailAgentsEvent();
}

class LoadDetailAgentsEvent extends DetailAgentsEvent {
  final String uuidAgents;

  LoadDetailAgentsEvent(this.uuidAgents);
}
