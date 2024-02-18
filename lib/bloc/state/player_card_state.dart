import 'package:valorant_wiki/data/models/player_card_model.dart';

abstract class PlayerCardState {}

class OnLoadingPlayerCards extends PlayerCardState {}

class OnLoadedPlayerCards extends PlayerCardState {
  final List<PlayerCardModel> playerCards;
  final bool hasReachedMax;

  OnLoadedPlayerCards({required this.playerCards, required this.hasReachedMax});

  OnLoadedPlayerCards copyWith(
      {List<PlayerCardModel>? playerCards, bool? hasReachedMax}) {
    return OnLoadedPlayerCards(
        playerCards: playerCards ?? this.playerCards,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class OnErrorPlayerCards extends PlayerCardState {
  final String error;

  OnErrorPlayerCards({required this.error});
}
