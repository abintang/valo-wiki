import 'package:valorant_wiki/data/models/map_model.dart';

abstract class MapState {}

class OnLoadingMapState extends MapState {}

class OnLoadedMapState extends MapState {
  final List<MapModel> maps;
  final bool hasReachedMax;

  OnLoadedMapState({required this.maps, required this.hasReachedMax});

  OnLoadedMapState copyWith({List<MapModel>? maps, bool? hasReachedMax}) {
    return OnLoadedMapState(
        maps: maps ?? this.maps,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class OnErrorMapState extends MapState {
  final String error;

  OnErrorMapState({required this.error});
}
