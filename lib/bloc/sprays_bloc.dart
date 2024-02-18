import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki/bloc/event/sprays_event.dart';
import 'package:valorant_wiki/bloc/state/sprays_state.dart';
import 'package:valorant_wiki/data/repositories/sprays_repository.dart';

class SpraysBloc extends Bloc<SprayEvent, SprayState> {
  SpraysBloc() : super(OnLoadingSpray()) {
    on<SprayEvent>((event, emit) async {
      if (event is LoadSprayEvent) {
        emit(OnLoadingSpray());
        try {
          final sprays = await SpraysRepository().getSprays();
          emit(OnLoadedSpray(
              sprays: sprays.sublist(0, 24), hasReachedMax: false));
        } catch (e) {
          emit(OnErrorSpray(err: e.toString()));
        }
      } else if (event is LoadMoreSprayEvent) {
        final currentState = state;
        if (currentState is OnLoadedSpray) {
          try {
            final sprays = await SpraysRepository().getSprays();
            int endIndex = currentState.sprays.length + 15;
            if (endIndex > sprays.length) {
              endIndex = sprays.length;
            }
            final currentSprays =
                sprays.sublist(currentState.sprays.length, endIndex);
            emit(sprays.isEmpty
                ? currentState.copyWith(hasReachedMax: true)
                : OnLoadedSpray(
                    sprays: currentState.sprays + currentSprays,
                    hasReachedMax: false));
          } catch (e) {
            emit(OnErrorSpray(err: e.toString()));
          }
        }
      }
    });
  }
}
