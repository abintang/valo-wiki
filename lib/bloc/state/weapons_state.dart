import 'package:valorant_wiki/data/models/weapon_model.dart';

abstract class WeaponsState {}

class WeaponsLoadingState extends WeaponsState {}

class WeaponsLoadedState extends WeaponsState {
  final List<WeaponsModel> weapons;
  final bool hasReachedMax;

  WeaponsLoadedState({required this.weapons, required this.hasReachedMax});

  WeaponsLoadedState copyWith(
      {List<WeaponsModel>? weapons, bool? hasReachedMax}) {
    return WeaponsLoadedState(
        weapons: weapons ?? this.weapons,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class WeaponsErrorsState extends WeaponsState {
  final String errors;
  WeaponsErrorsState(this.errors);
}
