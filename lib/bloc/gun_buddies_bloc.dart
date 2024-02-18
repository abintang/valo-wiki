import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki/bloc/event/gun_buddies_event.dart';
import 'package:valorant_wiki/bloc/state/gun_buddies_state.dart';
import 'package:valorant_wiki/data/repositories/gun_buddies_repository.dart';

class GunBuddiesBloc extends Bloc<GunBuddiesEvent, GunBuddiesState> {
  GunBuddiesBloc() : super(OnLoadingGunBuddies()) {
    on<GunBuddiesEvent>((event, emit) async {
      if (event is LoadGunBuddiesEvent) {
        emit(OnLoadingGunBuddies());
        try {
          final buddies = await GunBuddiesRepository().getBuddies();
          emit(OnLoadedGunBuddies(
              gunBuddies: buddies.sublist(0, 15), hasReachedMax: false));
        } catch (e) {
          emit(OnErrorGunBuddies(error: e.toString()));
        }
      } else if (event is LoadMoreGunBuddiesEvent) {
        final currentState = state;
        if (currentState is OnLoadedGunBuddies) {
          try {
            final buddies = await GunBuddiesRepository().getBuddies();
            int endIndex = currentState.gunBuddies.length + 12;
            if (endIndex > buddies.length) {
              endIndex = buddies.length;
            }
            final currentBuddies =
                buddies.sublist(currentState.gunBuddies.length, endIndex);
            emit(buddies.isEmpty
                ? currentState.copyWith(hasReachedMax: true)
                : OnLoadedGunBuddies(
                    gunBuddies: currentState.gunBuddies + currentBuddies,
                    hasReachedMax: false));
          } catch (e) {
            emit(OnErrorGunBuddies(error: e.toString()));
          }
        }
      }
    });
  }
}
