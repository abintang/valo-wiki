import 'package:valorant_wiki/data/models/gun_buddies_model.dart';

abstract class GunBuddiesState {}

class OnLoadingGunBuddies extends GunBuddiesState {}

class OnLoadedGunBuddies extends GunBuddiesState {
  final List<GunBuddiesModel> gunBuddies;
  final bool hasReachedMax;

  OnLoadedGunBuddies({required this.gunBuddies, required this.hasReachedMax});

  OnLoadedGunBuddies copyWith(
      {List<GunBuddiesModel>? gunBuddies, bool? hasReachedMax}) {
    return OnLoadedGunBuddies(
        gunBuddies: gunBuddies ?? this.gunBuddies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class OnErrorGunBuddies extends GunBuddiesState {
  final String error;

  OnErrorGunBuddies({required this.error});
}
