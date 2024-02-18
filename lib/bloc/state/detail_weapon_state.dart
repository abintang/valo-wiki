import 'package:valorant_wiki/data/models/weapon_model.dart';

abstract class DetailWeaponState {}

class LoadingDetailWeaponState extends DetailWeaponState {}

class LoadedDetailWeaponState extends DetailWeaponState {
  final WeaponsModel weaponsModel;

  LoadedDetailWeaponState({required this.weaponsModel});
}

class ErrorDetailWeaponState extends DetailWeaponState {
  final String error;
  ErrorDetailWeaponState({required this.error});
}
