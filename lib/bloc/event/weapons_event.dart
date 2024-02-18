abstract class WeaponsEvent {
  const WeaponsEvent();
}

class WeaponsLoadEvent extends WeaponsEvent {}

class WeaponsLoadMoreEvent extends WeaponsEvent {
  final int startIndex;
  final int count;
  WeaponsLoadMoreEvent({required this.startIndex, required this.count});
}
