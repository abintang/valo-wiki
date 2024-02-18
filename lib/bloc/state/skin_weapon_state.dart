import 'package:valorant_wiki/data/models/weapon_model.dart';

abstract class SkinWeaponState {}

class InitialSkinWeaponState extends SkinWeaponState {}

class LoadedSkinWeaponState extends SkinWeaponState {
  final List<Skins> skins;
  final bool hasReachedMax;

  LoadedSkinWeaponState({required this.skins, required this.hasReachedMax});

  LoadedSkinWeaponState copyWith({List<Skins>? skins, bool? hasReachedMax}) {
    return LoadedSkinWeaponState(
        skins: skins ?? this.skins,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class ErrorSkinWeaponState extends SkinWeaponState {
  final String error;
  ErrorSkinWeaponState({required this.error});
}
