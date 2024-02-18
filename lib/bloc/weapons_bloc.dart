import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki/bloc/event/weapons_event.dart';
import 'package:valorant_wiki/bloc/state/weapons_state.dart';
import 'package:valorant_wiki/data/repositories/weapons_repository.dart';

class WeaponsBloc extends Bloc<WeaponsEvent, WeaponsState> {
  WeaponsBloc() : super(WeaponsLoadingState()) {
    on<WeaponsEvent>((event, emit) async {
      if (event is WeaponsLoadEvent) {
        emit(WeaponsLoadingState());
        try {
          final weapons = await WeaponsRepository().getWeapons(0, 12);
          emit(WeaponsLoadedState(weapons: weapons, hasReachedMax: false));
        } catch (e) {
          emit(WeaponsErrorsState(e.toString()));
        }
      } else if (event is WeaponsLoadMoreEvent) {
        final currentState = state;
        if (currentState is WeaponsLoadedState) {
          try {
            final newWeaponsEntry = await WeaponsRepository()
                .getWeapons(event.startIndex, event.count);
            emit(newWeaponsEntry.isEmpty
                ? currentState.copyWith(hasReachedMax: true)
                : WeaponsLoadedState(
                    weapons: currentState.weapons + newWeaponsEntry,
                    hasReachedMax: false));
          } catch (e) {
            emit(WeaponsErrorsState(e.toString()));
          }
        }
      }
    });
  }
}
