import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki/bloc/event/player_cards_event.dart';
import 'package:valorant_wiki/bloc/state/player_card_state.dart';
import 'package:valorant_wiki/data/repositories/player_card_repository.dart';

class PlayerCardsBloc extends Bloc<PlayerCardEvent, PlayerCardState> {
  PlayerCardsBloc() : super(OnLoadingPlayerCards()) {
    on<PlayerCardEvent>((event, emit) async {
      if (event is LoadPlayerCardEvent) {
        emit(OnLoadingPlayerCards());
        try {
          final playerCards = await PlayerCardRepository().getPlayerCards();
          emit(OnLoadedPlayerCards(
              playerCards: playerCards.sublist(0, 10), hasReachedMax: false));
        } catch (e) {
          emit(OnErrorPlayerCards(error: e.toString()));
        }
      } else if (event is LoadMorePlayerCardEvent) {
        final currentState = state;
        if (currentState is OnLoadedPlayerCards) {
          try {
            final playerCards = await PlayerCardRepository().getPlayerCards();
            int endIndex = currentState.playerCards.length + 12;
            if (endIndex > playerCards.length) {
              endIndex = playerCards.length;
            }
            final currentCards =
                playerCards.sublist(currentState.playerCards.length, endIndex);
            emit(playerCards.isEmpty
                ? currentState.copyWith(hasReachedMax: true)
                : OnLoadedPlayerCards(
                    playerCards: currentState.playerCards + currentCards,
                    hasReachedMax: false));
          } catch (e) {
            emit(OnErrorPlayerCards(error: e.toString()));
          }
        }
      }
    });
  }
}
