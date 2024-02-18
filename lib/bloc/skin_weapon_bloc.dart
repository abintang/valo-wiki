import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_wiki/bloc/event/skin_weapon_event.dart';
import 'package:valorant_wiki/bloc/state/skin_weapon_state.dart';
import 'package:valorant_wiki/data/repositories/weapons_repository.dart';

class SkinWeaponBloc extends Bloc<SkinWeaponEvent, SkinWeaponState> {
  SkinWeaponBloc() : super(InitialSkinWeaponState()) {
    on<SkinWeaponEvent>((event, emit) async {
      if (event is LoadSkinsWeaponEvent) {
        try {
          final detailWeapon =
              await WeaponsRepository().getDetailWeapon(event.uuidWeapons);
          if (detailWeapon.skins.length > 4) {
            final currentSkins = detailWeapon.skins.sublist(0, 4);
            emit(LoadedSkinWeaponState(
                skins: currentSkins, hasReachedMax: false));
          } else {
            emit(LoadedSkinWeaponState(
                skins: detailWeapon.skins, hasReachedMax: true));
          }
        } catch (e) {
          emit(ErrorSkinWeaponState(error: e.toString()));
        }
      } else if (event is LoadMoreSkinsWeaponEvent) {
        final currentState = state;
        if (currentState is LoadedSkinWeaponState) {
          try {
            final detailWeapon =
                await WeaponsRepository().getDetailWeapon(event.uuidWeapons);
            int endIndex = currentState.skins.length + 4;
            if (endIndex > detailWeapon.skins.length) {
              endIndex = detailWeapon.skins.length;
            }
            final currentSkins =
                detailWeapon.skins.sublist(currentState.skins.length, endIndex);
            emit(currentSkins.isEmpty
                ? currentState.copyWith(hasReachedMax: true)
                : LoadedSkinWeaponState(
                    skins: currentState.skins + currentSkins,
                    hasReachedMax: false));
          } catch (e) {
            emit(ErrorSkinWeaponState(error: e.toString()));
          }
        }
      }
    });
  }
}
