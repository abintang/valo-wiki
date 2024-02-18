import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki/bloc/event/maps_event.dart';
import 'package:valorant_wiki/bloc/state/maps_state.dart';
import 'package:valorant_wiki/data/repositories/maps_repository.dart';

class MapsBloc extends Bloc<MapEvent, MapState> {
  MapsBloc() : super(OnLoadingMapState()) {
    on<MapEvent>((event, emit) async {
      if (event is LoadMapEvent) {
        emit(OnLoadingMapState());
        try {
          final maps = await MapsRepository().getMaps();
          emit(
              OnLoadedMapState(maps: maps.sublist(0, 6), hasReachedMax: false));
        } catch (e) {
          emit(OnErrorMapState(error: e.toString()));
        }
      } else if (event is LoadMoreMapEvent) {
        final currentState = state;
        if (currentState is OnLoadedMapState) {
          try {
            final maps = await MapsRepository().getMaps();
            int endIndex = currentState.maps.length + 4;
            if (endIndex > maps.length) {
              endIndex = maps.length;
            }
            final currentMaps =
                maps.sublist(currentState.maps.length, endIndex);
            emit(maps.isEmpty
                ? currentState.copyWith(hasReachedMax: true)
                : OnLoadedMapState(
                    maps: currentState.maps + currentMaps,
                    hasReachedMax: false));
          } catch (e) {
            emit(OnErrorMapState(error: e.toString()));
          }
        }
      }
    });
  }
}
